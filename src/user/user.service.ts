import {Injectable} from '@nestjs/common';
import {CreateUserDto} from './dto/create-user.dto.js';
import {UpdateUserDto} from './dto/update-user.dto.js';
import {PrismaService} from "../config/prisma/prisma.service.js";

@Injectable()
export class UserService {
    constructor(private prisma: PrismaService) {
    }

    public async create(createUserDto: CreateUserDto) {
        return this.prisma.user.create({
            data: createUserDto,
        });
    }

    public async findAll() {
        return this.prisma.user.findMany();
    }

    public async findOne(id: number) {
        return this.prisma.user.findUnique({
            where: {id}
        });
    }

    public async update(id: number, updateUserDto: UpdateUserDto) {
        return this.prisma.user.update({
            where: {id},
            data: updateUserDto,
        });
    }

    public async remove(id: number) {
        return this.prisma.user.delete({
            where: {id},
        });
    }
}
