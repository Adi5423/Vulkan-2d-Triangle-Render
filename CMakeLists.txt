cmake_minimum_required(VERSION 3.15)
project(VulkN_GLFW_Triangle)

# Require C++17
set(CMAKE_CXX_STANDARD 17)

# Find Vulkan SDK automatically via environment VULKAN_SDK
if (NOT DEFINED ENV{VULKAN_SDK})
    message(FATAL_ERROR "Please set VULKAN_SDK to your Vulkan SDK folder (e.g. D:/Vulkan/SDK/Installation).")
endif()

# Set Vulkan include/lib paths
set(VULKAN_INCLUDE_DIRS   $ENV{VULKAN_SDK}/Include)
set(VULKAN_LIBRARY_DIRS   $ENV{VULKAN_SDK}/Lib)
find_library(VULKAN_LIBRARY NAMES vulkan-1 PATHS ${VULKAN_LIBRARY_DIRS})

# GLFW: adjust these to your actual paths
set(GLFW_INCLUDE_DIR      "D:/Libraries/glfw/glfw-3.4.bin.WIN64/include")
set(GLFW_LIBRARY          "D:/Libraries/glfw/glfw-3.4.bin.WIN64/lib-mingw-w64/libglfw3.a")

include_directories(
    ${VULKAN_INCLUDE_DIRS}
    ${GLFW_INCLUDE_DIR}
)

link_directories(
    ${VULKAN_LIBRARY_DIRS}
)

add_executable(VulkN_Triangle main.cpp)

# Link Vulkan and GLFW
target_link_libraries(VulkN_Triangle
    ${VULKAN_LIBRARY}
    ${GLFW_LIBRARY}
)

# Copy shaders to binary dir
file(COPY shaders/triangle.vert shaders/triangle.frag DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/shaders)
