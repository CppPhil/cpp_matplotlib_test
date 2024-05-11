cmake_minimum_required(VERSION 3.28)

project(matplotlibtestproject)

find_package(
  Python3
  COMPONENTS
  Interpreter
  Development.Embed
  Development.Module
  NumPy
  REQUIRED
)

add_executable(
  matplotlibtest
  main.cpp
)

target_link_libraries(
  matplotlibtest
  PRIVATE
  Python3::Python
  Python3::Module
  Python3::NumPy
)

target_include_directories(
  matplotlibtest
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/external/matplotlib-cpp
)
