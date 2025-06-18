@echo off
if not defined VULKAN_SDK (
    echo [ERROR] VULKAN_SDK not defined.
    exit /b 1
)
cd /d %~dp0

"%VULKAN_SDK%\Bin\glslangValidator.exe" -V triangle.vert -o triangle.vert.spv
"%VULKAN_SDK%\Bin\glslangValidator.exe" -V triangle.frag -o triangle.frag.spv
echo [INFO] SPIR-V shaders generated.
pause
