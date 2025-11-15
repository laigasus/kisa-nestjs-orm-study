import { defineConfig, env } from "prisma/config";

const postgresUser = env("POSTGRES_USER");
const postgresPassword = env("POSTGRES_PASSWORD");
const postgresUrl = env("POSTGRES_URL");
const postgresPort = env("POSTGRES_PORT");
const postgresDatabase = env("POSTGRES_DATABASE");
const postgresSchema = env("POSTGRES_SCHEMA");

const databaseUrl = `postgresql://${postgresUser}:${postgresPassword}@${postgresUrl}:${postgresPort}/${postgresDatabase}?schema=${postgresSchema}`;

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
  },
  engine: "classic",
  datasource: {
    url: databaseUrl,
  },
});
