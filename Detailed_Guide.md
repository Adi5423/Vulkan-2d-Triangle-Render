<p align="center">
  <img src="https://raw.githubusercontent.com/yourusername/yourrepo/main/assets/vulkan_logo.png" alt="Vulkan Triangle" width="120"/>
</p>

<h1 align="center">📝 Detailed Guide: Vulkan Triangle (GLFW)</h1>

---

## 📚 Table of Contents
- [🎯 Project Motivation & History](#-project-motivation--history)
- [🏗️ Architecture Overview](#-architecture-overview)
- [🛠️ Vulkan & GLFW Setup](#-vulkan--glfw-setup)
- [🎨 Shader Pipeline](#-shader-pipeline)
- [⚙️ Build System (CMake)](#-build-system-cmake)
- [🔍 main.cpp: Full Walkthrough](#-maincpp-full-walkthrough)
- [🧩 Troubleshooting & Lessons Learned](#-troubleshooting--lessons-learned)
- [🔗 References](#-references)

---

## 🎯 Project Motivation & History

> **Why this project?**
>
> - To create the simplest, most portable Vulkan triangle demo in C++.
> - To learn the difference between Qt's Vulkan wrappers and pure Vulkan/GLFW.
> - To document every step, pitfall, and solution for future reference.

### 🥊 The Qt + QVulkanWindow "Boss Fight"
- **Goal:** Render a triangle using Vulkan in a Qt window for rapid prototyping.
- **Problems:**
  - Qt build lacked Vulkan plugin (`QVulkanWindow`/`deviceFunctions()` missing).
  - API changes in Qt 6 vs. older examples.
  - Toolchain mismatches and missing dependencies.
- **Result:** Switched to GLFW for windowing and direct Vulkan API usage.

### 🚀 The GLFW + Pure Vulkan Solution
- **Why GLFW?**
  - 🪶 Lightweight, cross-platform, and purpose-built for OpenGL/Vulkan windowing.
  - 🚫 No Qt dependencies or plugin headaches.
- **Dependencies:** Vulkan SDK, GLFW, CMake, C++17 compiler.

---

## 🏗️ Architecture Overview

- **main.cpp:** All Vulkan and GLFW logic in a single file for clarity.
- **shaders/:** Contains GLSL source and compiled SPIR-V binaries.
- **CMakeLists.txt:** Handles build configuration, dependency paths, and post-build steps.

**Core Flow:**
1. Initialize GLFW and create a window (no OpenGL context).
2. Set up Vulkan instance, surface, and device.
3. Create swapchain, image views, render pass, and graphics pipeline.
4. Compile and load shaders (SPIR-V).
5. Record command buffers to draw a triangle.
6. Enter main loop: poll events, draw frame, present.
7. Cleanup all Vulkan and GLFW resources.

---

## 🛠️ Vulkan & GLFW Setup

### 📋 Minimum Requirements

| Requirement      | Version/Details                |
|------------------|-------------------------------|
| OS               | Windows 10+ (Linux possible)  |
| Vulkan SDK       | 1.2+ ([Download](https://vulkan.lunarg.com/sdk/home)) |
| CMake            | 3.15+                         |
| C++ Compiler     | C++17 (MinGW-w64, MSVC, GCC/Clang) |
| GLFW             | Prebuilt static lib/headers    |

> **Note:** Set the `VULKAN_SDK` environment variable (e.g. `D:/Vulkan/SDK/Installation`).

### 🏁 Environment Setup
- Download and install the Vulkan SDK.
- Download and extract GLFW. Update `CMakeLists.txt` with correct include/lib paths.

---

## 🎨 Shader Pipeline

### ✍️ GLSL Source
- **Vertex Shader (`triangle.vert`):**
  ```glsl
  #version 450
  layout(location = 0) out vec3 fragColor;
  vec2 positions[3] = vec2[](
      vec2(0.0, -0.5),
      vec2(0.5, 0.5),
      vec2(-0.5, 0.5)
  );
  vec3 colors[3] = vec3[](
      vec3(1.0, 0.0, 0.0),
      vec3(0.0, 1.0, 0.0),
      vec3(0.0, 0.0, 1.0)
  );
  void main() {
      gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
      fragColor = colors[gl_VertexIndex];
  }
  ```
- **Fragment Shader (`triangle.frag`):**
  ```glsl
  #version 450
  layout(location = 0) in vec3 fragColor;
  layout(location = 0) out vec4 outColor;
  void main() {
      outColor = vec4(fragColor, 1.0);
  }
  ```

### ⚡ Compiling Shaders
- Use `shaders/compileShaders.bat`:
  ```bat
  "%VULKAN_SDK%\Bin\glslangValidator.exe" -V triangle.vert -o triangle.vert.spv
  "%VULKAN_SDK%\Bin\glslangValidator.exe" -V triangle.frag -o triangle.frag.spv
  ```
- Output: `triangle.vert.spv`, `triangle.frag.spv` (used at runtime)

---

## ⚙️ Build System (CMake)

- **CMakeLists.txt** configures include paths, libraries, and post-build steps:
  - Finds Vulkan SDK via `VULKAN_SDK` env var.
  - Sets GLFW include/lib paths (edit as needed).
  - Adds executable and links Vulkan/GLFW.
  - Copies shader source and SPIR-V binaries to build output.

**Key CMake Snippet:**
```cmake
add_executable(VulkN_Triangle main.cpp)
target_link_libraries(VulkN_Triangle ${VULKAN_LIBRARY} ${GLFW_LIBRARY})
file(COPY shaders/triangle.vert shaders/triangle.frag DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/shaders)
```

---

## 🔍 main.cpp: Full Walkthrough

### 1️⃣ File Reading Utility
- `readFile`: Loads binary files (SPIR-V) into a `std::vector<char>`.

### 2️⃣ TriangleApp Class
- **run()**: Entry point. Calls `initWindow`, `initVulkan`, `mainLoop`, `cleanup`.
- **initWindow()**: Initializes GLFW, creates a window (no OpenGL context).
- **initVulkan()**: Sets up Vulkan instance, surface, device, swapchain, image views, render pass, pipeline, framebuffers, command pool, command buffers, and semaphores.
- **mainLoop()**: Polls window events and draws frames until the window closes.
- **cleanup()**: Destroys all Vulkan and GLFW resources in reverse order.

#### 🧩 Vulkan Setup Steps
- **createInstance**: Sets up Vulkan application info and required extensions.
- **createSurface**: Creates a Vulkan surface for the GLFW window.
- **pickPhysicalDevice**: Selects a GPU that supports required Vulkan features.
- **createLogicalDevice**: Creates a logical device and retrieves the graphics queue.
- **createSwapChain**: Configures and creates the swapchain for presenting images.
- **createImageViews**: Creates image views for each swapchain image.
- **createRenderPass**: Defines how rendering will be performed (color attachment, clear/store ops).
- **createGraphicsPipeline**: Loads SPIR-V shaders, sets up pipeline stages, and creates the graphics pipeline.
- **createFramebuffers**: Creates framebuffers for each swapchain image view.
- **createCommandPool**: Allocates a command pool for command buffers.
- **createCommandBuffers**: Records commands to draw the triangle.
- **createSemaphores**: Synchronization primitives for rendering.
- **drawFrame**: Acquires an image, submits draw commands, and presents the result.

#### 🏁 Main Function
- Instantiates `TriangleApp` and calls `run()` inside a try-catch block.

---

## 🧩 Troubleshooting & Lessons Learned

### ⚠️ Common Pitfalls
- **VULKAN_SDK not set:** CMake will fail. Set the environment variable to your Vulkan SDK path.
- **GLFW not found:** Update `GLFW_INCLUDE_DIR` and `GLFW_LIBRARY` in `CMakeLists.txt`.
- **SPIR-V files missing:** Always compile shaders before building/running.
- **Qt Vulkan plugin missing:** If using Qt, ensure your build includes Vulkan support. (Not needed for this GLFW version.)
- **API changes:** Vulkan and Qt APIs evolve; always check documentation for your version.

### 💡 Lessons Learned
- Direct Vulkan + GLFW is more portable and less error-prone than relying on Qt's Vulkan wrappers (unless you need Qt's UI features).
- Always automate shader compilation and copying in your build system.
- Keep all resource creation and destruction tightly managed to avoid leaks and crashes.

---

## 🔗 References
- [Khronos Vulkan Tutorial](https://vulkan-tutorial.com/)
- [GLFW Documentation](https://www.glfw.org/docs/latest/)
- [Vulkan SDK](https://vulkan.lunarg.com/)
- [CMake Documentation](https://cmake.org/cmake/help/latest/)

---

> For further details, see the source code and comments in `main.cpp`. This guide is meant to provide both a high-level overview and a deep technical reference for anyone wishing to understand or extend this minimal Vulkan+GLFW project. 