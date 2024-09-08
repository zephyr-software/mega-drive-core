#!/bin/bash


# description:
# mega drive core - project build script
#
# builds a binary file from assembly source code
# deletes the previous build if it exists
#
# can clean build
# can run / debug build in emulators
#
# usage:
# ./main.sh --help     prints help screen
# ./main.sh --build    build project files [default option]
# ./main.sh --clean    delete all files from build directory
# ./main.sh --run      run rom using blatem emulator
# ./main.sh --debug    debug rom using regen / exodus emulator


# ==============================================================================
# variables
#
# ==============================================================================
assembler=/home/zephyr/soft/asmx-2.0b5/asmx
emulator=/home/zephyr/soft/blastem64-0.6.3-pre-827ab6dd534a/blastem

work_dir=$(pwd)
src_dir=src
build_dir=build

z80_bin=z80.bin
m68k_bin=m68k.bin


# ==============================================================================
# code
#
# ==============================================================================
echo "mega drive core - project build script"
echo


# --------------------------------------
# print help screen
# --------------------------------------
if test "$1" = "--help"; then
    echo "usage: main.sh [options]..."
    echo "build, clean, run / debug project files"
    echo
    echo "--build    build project files [default option]"
    echo "--clean    delete all files from build directory"
    echo "--run      run rom using blatem emulator"
    echo "--debug    debug rom using regen / exodus emulator"
    echo

    exit 0
fi


# --------------------------------------
# clean project
# --------------------------------------
if test "$1" = "--clean"; then
    echo "clean project - deleting files in a directory: "$build_dir

    cd $build_dir || exit 1

    if test -e $z80_bin; then
        rm $z80_bin
        echo "- $z80_bin : file deleted"
    else
        echo "- $z80_bin : file already deleted"
    fi

    if test -e $m68k_bin; then
        rm $m68k_bin
        echo "- $m68k_bin: file deleted"
    else
        echo "- $m68k_bin: file already deleted"
    fi

    cd $work_dir

    exit 0
fi


# --------------------------------------
# run project
# --------------------------------------
if test "$1" = "--run"; then

    if test ! -e $build_dir"/"$m68k_bin; then
        echo $m68k_bin": file does not exist"

        exit 1
    fi

    echo "run project"
    $emulator $work_dir"/"$build_dir"/"$m68k_bin

    exit 0
fi


# --------------------------------------
# build project
# --------------------------------------
echo "build project - assemble files in a directory: "$build_dir

cd $build_dir

# delete previous build if exist
if test -e $z80_bin; then
    rm $z80_bin
    echo "- "$z80_bin" : file deleted"
fi

if test -e $m68k_bin; then
    rm $m68k_bin
    echo "- "$z80_bin" : file deleted"
fi

# build new binary files
cd $work_dir
cd $src_dir/z80
$assembler -C Z80 -e -w -o $work_dir"/"$build_dir"/"$z80_bin -b -- main.z80

cd $work_dir
cd $src_dir/m68k
$assembler -C 68K -e -w -o $work_dir"/"$build_dir"/"$m68k_bin -b -- main.m68k

cd $work_dir
exit 0
