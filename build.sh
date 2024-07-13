#!/bin/bash
export EMSDK_QUIET=1
source emsdk/emsdk_env.sh 
OPTIMIZATION=-O3

## Raylib
if [ ! -f raylib/LICENSE ];then
    echo "raylib not found. Did you clone the submodule?" >&2
    exit 1;
fi

if [ ! -f objs/raylib/libraylib.a ];then
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/rcore.o     -c raylib/src/rcore.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/rshapes.o   -c raylib/src/rshapes.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/rtextures.o -c raylib/src/rtextures.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/rtext.o     -c raylib/src/rtext.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/rmodels.o   -c raylib/src/rmodels.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/utils.o     -c raylib/src/utils.c
    emcc -fno-rtti -fno-exceptions -flto -g0 $OPTIMIZATION -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES3 -o objs/raylib/raudio.o    -c raylib/src/raudio.c
    emar rcs objs/raylib/libraylib.a objs/*.o
fi
set -e

## src
emcc -fno-rtti -fno-exceptions  -flto -g0 $OPTIMIZATION -Wall -Wextra -pedantic -std=c11 -Iincludes -o objs/wasm.o -c src/*.c

## linking
emcc -flto $OPTIMIZATION -sENVIRONMENT=web -sEVAL_CTORS -sUSE_GLFW=3 -sSTACK_SIZE=8388608 -o basicwasm.html objs/raylib/*.o objs/*.o > /dev/null