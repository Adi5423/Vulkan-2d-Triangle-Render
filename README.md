<p align="center">
  <img src="https://raw.githubusercontent.com/adi5423/Vulkan-2d-Triangle-Render/main/assets/vulkan_logo.png" alt="Vulkan Triangle" width="120"/>
</p>

<h1 align="center">Vulkan Triangle (GLFW)</h1>

<p align="center">
  <b>Minimal Vulkan + GLFW Triangle Demo</b><br/>
  <a href="#minimum-requirements"><img src="https://img.shields.io/badge/Platform-Windows%2010%2B-blue?logo=windows"/></a>
  <a href="#minimum-requirements"><img src="https://img.shields.io/badge/Vulkan-1.2%2B-red?logo=vulkan"/></a>
  <a href="#minimum-requirements"><img src="https://img.shields.io/badge/CMake-3.15%2B-blue?logo=cmake"/></a>
  <a href="#minimum-requirements"><img src="https://img.shields.io/badge/C%2B%2B-17-blue?logo=c%2B%2B"/></a>
</p>

---

## 🚀 Overview
A minimal, modern C++17 project that renders a triangle using Vulkan and GLFW. No Qt, no bloat—just pure Vulkan API, cross-platform windowing, and custom shaders.

---

## ✨ Features
- ⚡ **Minimal, modern C++17 codebase**
- 🖼️ **Pure Vulkan API** (no Qt)
- 🪟 **GLFW windowing**
- 🎨 **Custom GLSL shaders → SPIR-V**
- 🛠️ **CMake-based build system**

---

## 📋 Minimum Requirements

| Requirement      | Version/Details                |
|------------------|-------------------------------|
| OS               | Windows 10+ (Linux possible)  |
| Vulkan SDK       | 1.2+ ([Download](https://vulkan.lunarg.com/sdk/home)) |
| CMake            | 3.15+                         |
| C++ Compiler     | C++17 (MinGW-w64, MSVC, GCC/Clang) |
| GLFW             | Prebuilt static lib/headers    |

> **Note:** Set the `VULKAN_SDK` environment variable (e.g. `D:/Vulkan/SDK/Installation`).
> **Note:** Also update the (`GLFW_INCLUDE_DIR` and `GLFW_LIBRARY`)'s locations in the [CMakeLists.txt](CMakeLists.txt)   
---

## 🗂️ Project Structure
```text
.
├── main.cpp                # Main application source
├── CMakeLists.txt          # Build configuration
├── shaders/
│   ├── triangle.vert       # Vertex shader (GLSL)
│   ├── triangle.frag       # Fragment shader (GLSL)
│   ├── triangle.vert.spv   # Compiled vertex shader (SPIR-V, generated)
│   ├── triangle.frag.spv   # Compiled fragment shader (SPIR-V, generated)
│   └── compileShaders.bat  # Batch file to compile GLSL to SPIR-V
├── guide.txt               # Quick build/run instructions
├── Detailed_Guide.md       # In-depth technical guide (see this for full details)
```

---

## 🛠️ Setup & Build Instructions

1. **Compile Shaders:**
   ```sh
   .\shaders\compileShaders.bat
   ```
2. **Configure the Build:**
   ```sh
   mkdir build && cd build
   cmake .. -G "MinGW Makefiles"
   ```
3. **Copy SPIR-V Shaders:**
   ```sh
   copy ..\shaders\*.spv shaders
   ```
   (CMake may do this automatically; see `CMakeLists.txt`)
4. **Re-run CMake (if needed):**
   ```sh
   cmake .. -G "MinGW Makefiles"
   ```
5. **Build the Project:**
   ```sh
   mingw32-make
   ```
6. **Run the Application:**
   ```sh
   .\VulkN_Triangle.exe
   ```

---

## 🧩 Troubleshooting
- ❗ **VULKAN_SDK not defined:** Set the environment variable to your Vulkan SDK path.
- ❗ **GLFW not found:** Update the GLFW include/library paths in `CMakeLists.txt`.
- ❗ **SPIR-V files missing:** Compile shaders and copy `.spv` files to the build directory before running.
- ❗ **Other build errors:** Ensure your compiler supports C++17 and all dependencies are installed.

---

## 🙏 Credits
- Based on the Khronos Vulkan Tutorial and adapted for pure GLFW usage.
- See [`Detailed_Guide.md`](./Detailed_Guide.md) for a full technical breakdown and project history.

---

## 📜 License

Licensed under the **MIT License**. See [`LICENSE.txt`](LICENSE.txt).

---

## 📬 Contact if encountered any issues.

* ✉️  [adii54ti23@gmail.com](mailto:adii54ti23@gmail.com)
* 💼 [LinkedIn](https://www.linkedin.com/in/aditya-tiwari-141731329/)
* 📸 [Instagram @adii5423\_](https://www.instagram.com/adii5423_)

Made with ❤️ by Adii