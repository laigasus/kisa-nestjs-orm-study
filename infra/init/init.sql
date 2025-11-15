SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET search_path TO public;

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "authorId" INTEGER NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "bio" TEXT,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;


-- 사용자 더미 데이터 생성
INSERT INTO "User" ("email", "name")
VALUES ('kim.minsu@example.com', '김민수'),
       ('lee.jieun@example.com', '이지은'),
       ('park.jiho@example.com', '박지호');

-- 프로필 더미 데이터 생성
INSERT INTO "Profile" ("bio", "userId")
VALUES ('백엔드 개발자 / 취미는 독서와 등산', 1),
       ('프론트엔드 개발자 / UX/UI 디자인 전문가', 2),
       ('풀스택 개발자 / 새로운 기술에 관심이 많음', 3);

-- 게시물 더미 데이터 생성
INSERT INTO "Post" ("title", "content", "published", "authorId", "updatedAt")
VALUES ('Node.js 시작하기', 'Node.js는 자바스크립트 런타임 환경으로...', true, 1, CURRENT_TIMESTAMP),
       ('리액트 컴포넌트 설계 방법', '효율적인 리액트 컴포넌트를 만드는 방법을 소개합니다...', true, 2, CURRENT_TIMESTAMP),
       ('데이터베이스 최적화 팁', '데이터베이스 성능 향상을 위한 실용적인 팁들을 공유합니다...', false, 3, CURRENT_TIMESTAMP),
       ('TypeScript 실전 활용법', 'TypeScript를 실무에서 효과적으로 사용하는 방법...', true, 1, CURRENT_TIMESTAMP),
       ('웹 개발 트렌드 2025', '최신 웹 개발 트렌드와 기술 스택 분석...', true, 2, CURRENT_TIMESTAMP);