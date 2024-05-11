cmake_minimum_required(VERSION 3.0)

project(matplotlibtestproject)

add_subdirectory(external/matplotlib-cpp)

add_executable(
  matplotlibtest
  main.cpp
)

target_link_libraries(
  matplotlibtest
  matplotlib-cpp
)
