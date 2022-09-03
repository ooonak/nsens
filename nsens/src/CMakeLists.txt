cmake_minimum_required(VERSION 3.16)

project(nsens VERSION 0.0.1 LANGUAGES CXX)

file(WRITE ${PROJECT_BINARY_DIR}/nsensconfig.hpp.in "
#pragma once

#define NSENS_VERSION_MAJOR @nsens_VERSION_MAJOR@
#define NSENS_VERSION_MINOR @nsens_VERSION_MINOR@
#define NSENS_VERSION_PATCH @nsens_VERSION_PATCH@
")

find_package(spdlog REQUIRED)
find_package(nng REQUIRED)
find_package(qcbor REQUIRED)

add_library(nsens
    include/nsens/nsens.hpp
    nsens.cpp
    BME68x-Sensor-API-4.4.7/bme68x.c
    BME68x-Sensor-API-4.4.7/bme68x.h
    BME68x-Sensor-API-4.4.7/bme68x_defs.h
)

target_compile_features(nsens PUBLIC cxx_std_20)

target_include_directories(nsens
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}>
    $<INSTALL_INTERFACE:include>
    ${spdlog_SOURCE_DIR}/include
)

target_link_libraries(nsens
    PRIVATE
    spdlog::spdlog
    nng::nng
    qcbor::qcbor
)

add_library(nsens::nsens ALIAS nsens)

configure_file("${PROJECT_BINARY_DIR}/nsensconfig.hpp.in" nsensconfig.hpp)

install(TARGETS nsens
        EXPORT ${CMAKE_PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(DIRECTORY include/nsens
        DESTINATION nsens
        COMPONENT Devel
)

