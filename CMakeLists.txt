cmake_minimum_required(VERSION 3.12)

project (cpp_and_asm)

enable_language(ASM_MASM)

add_executable(cpp_and_asm main.cpp func.asm)