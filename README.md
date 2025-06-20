![Platform](https://img.shields.io/badge/Platform-Windows%2010%2B-blue?logo=windows)
![Language](https://img.shields.io/badge/C%2B%2B-17-blue?logo=c%2B%2B)
![Build](https://img.shields.io/badge/CMake-3.21%2B-blue?logo=cmake)
![Graphics](https://img.shields.io/badge/OpenGL-4.6-green?logo=opengl)
![License](https://img.shields.io/badge/License-MIT-yellow?logo=license)

<h1 align="center">✨ Groove Game Engine</h1>

<p align="center">
  <b>A next-gen modular C++ game engine</b><br/>
  Built with OpenGL, GLFW, ImGui, and CMake.<br/>
  <i>Realistic simulation • Extensible core • Modern code</i>
</p>

---

<div align="center">
  <img src="resources/proof1.png" width="400" alt="Groove Engine Screenshot" />
  <br>
  <strong>🚦 If you see a spinning 3D cube, you're ready to groove!</strong>
</div>

---

## 🗂️ Project Structure

```text
Groove/
├─ engine/         # Core engine modules
│  ├─ Input/       # Input abstraction
│  ├─ Renderer/    # OpenGL, ImGui, shaders
│  ├─ Utils/       # Logger, helpers
│  └─ src/         # Engine, Window, Camera, TimeStep
├─ sandbox/        # Demo app (entry point)
├─ resources/      # Screenshots, shaders, textures
├─ out/            # CMake build output
├─ LICENSE.txt     # MIT License
├─ README.md       # This file
├─ Detailed_Guide.md # Deep-dive technical guide
└─ .gitignore
```

---

## 🚀 Features

| Subsystem        | Status | Highlights                                 |
| ---------------- | :----: | ------------------------------------------ |
| 🛠️ Build System |    ✅   | CMake-based, modular targets               |
| 🪟 Windowing     |    ✅   | GLFW, resizable, VSync toggle              |
| 🎮 Input         |    ✅   | Keyboard/mouse support with edge detection |
| 📜 Logging       |    ✅   | Color console, file logs                   |
| 🖼️ Rendering    |    ✅   | OpenGL, VAO/VBO/IBO, shaders, 3D cube      |
| 🧰 UI (ImGui)    |    ✅   | Overlay, debug panels                      |
| ⏱️ Delta Time    |    ✅   | Smooth animations with TimeStep            |
| 🧠 Next Features |   🔲   | ECS, events, scene, vehicles, roads        |

---

## 📦 Requirements

* **C++17** or newer
* **Visual Studio 2022** (Desktop C++)
* **CMake 3.21+**
* **vcpkg** (for dependencies)

```bash
vcpkg install glfw3 glad glm imgui[glfw-binding,opengl3-binding]
```

---

## ⚡ Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/Adi5423/Groove-Game-Engine.git
cd Groove-Game-Engine
```

### 2. Configure with CMake

```bash
cmake -S . -B out/build/windows-debug -G "Visual Studio 17 2022" -A x64 ^
  -DCMAKE_TOOLCHAIN_FILE="<VCPKG_PATH>/scripts/buildsystems/vcpkg.cmake"
```

### 3. Build the Engine

```bash
cmake --build out/build/windows-debug --config Debug
```

### 4. Run the Demo

```bash
./out/build/windows-debug/sandbox/Sandbox.exe
```

---

## 🧩 Visual Studio Workflow

* Open root folder in **Visual Studio 2022**
* Save any `CMakeLists.txt` to auto-trigger reconfigure
* Build with `Ctrl+Shift+B` or **Build > Rebuild All**
* Run `Sandbox.exe` from the output folder

---

## 🎮 Controls

| Action        | Key / Input      |
| ------------- | ---------------- |
| Move Forward  | `W`              |
| Move Backward | `S`              |
| Move Left     | `A`              |
| Move Right    | `D`              |
| Move Up       | `Space`          |
| Move Down     | `Ctrl`           |
| Look Around   | `Mouse Movement` |
| Toggle Cursor | `ESC`            |

---

## 🖼️ Screenshots

| Output     | Preview                         |
| ---------- | ------------------------------- |
| proof1.png | ![proof1](resources/proof1.png) |
| proof2.png | ![proof2](resources/proof2.png) |

---

## 🗺️ Roadmap

* [x] Logging, Input, Window, Shaders, ImGui, 3D Cube
* [ ] ECS, Events, Scene System, Vehicles, Roads

---

## 📜 License

Licensed under the **MIT License**. See [`LICENSE.txt`](LICENSE.txt).

---

## 📬 Contact

* ✉️ [adii54ti23@gmail.com](mailto:adii54ti23@gmail.com)
* 💼 [LinkedIn](https://www.linkedin.com/in/aditya-tiwari-141731329/)
* 📸 [Instagram @adii5423\_](https://www.instagram.com/adii5423_)

<p align="center"><i>Made with ❤️ by Adii</i></p>
