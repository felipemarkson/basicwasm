#include <emscripten/emscripten.h>
#include "../raylib/src/raylib.h"

const int screenWidth = 800;
const int screenHeight = 450;

void UpdateDrawFrame(void);  // Update and Draw one frame

int main(void) {
    InitWindow(screenWidth, screenHeight, "Hello, Raylib!");
    emscripten_set_main_loop(UpdateDrawFrame, 0, 1);
    CloseWindow();
    return 0;
}
void UpdateDrawFrame(void) {
    BeginDrawing();
    {
        ClearBackground(RAYWHITE);
        DrawFPS(0,0);
        DrawText("Congrats! You created your first window!", 190, 200, 20, BLACK);
    }
    EndDrawing();
}
