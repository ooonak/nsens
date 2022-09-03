cmake_minimum_required(VERSION 3.16)

project(nsens LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(MANAGE_DEPENDENCIES_WITH_CONAN ON)
#set(MANAGE_DEPENDENCIES_WITH_FETCH_CONTENT ON)
include(Dependencies.cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
include(snippets)

enable_clang_tidy()
#enable_cppcheck()
#enable_iwyu()

set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnull-dereference")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wunused -Wnon-virtual-dtor -Woverloaded-virtual")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wold-style-cast -Wcast-qual -Wcast-align -Wsign-conversion")

if (${CMAKE_BUILD_TYPE} STREQUAL "Release")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
else()
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O1")
endif()

message(STATUS "CXX flags: ${CMAKE_CXX_FLAGS}")

add_subdirectory(src)
add_subdirectory(app)

include(CTest)
enable_testing()
add_subdirectory(test)

