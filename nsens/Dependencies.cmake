include(FetchContent)

if (MANAGE_DEPENDENCIES_WITH_CONAN)
    message(STATUS "Dependencies are handled by Conan.")
    include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
    #include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    #conan_init(cmake)
elseif(MANAGE_DEPENDENCIES_WITH_FETCH_CONTENT)
    message(STATUS "Dependencies are handled by FetchContent.")

    # set(FETCHCONTENT_TRY_FIND_PACKAGE_MODE ALWAYS / NEVER) New in 3.24

    FetchContent_Declare(
        spdlog
        URL https://github.com/gabime/spdlog/archive/refs/tags/v1.10.0.tar.gz
        URL_HASH SHA256=697f91700237dbae2326b90469be32b876b2b44888302afbc7aceb68bcfe8224
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_Declare(
        toml
        URL https://github.com/ToruNiina/toml11/archive/refs/tags/v3.7.1.tar.gz
        URL_HASH SHA256=afeaa9aa0416d4b6b2cd3897ca55d9317084103077b32a852247d8efd4cf6068
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_Declare(
        json
        URL https://github.com/nlohmann/json/releases/download/v3.11.1/json.tar.xz
        URL_HASH SHA256=e6dd39f8f2da9cab11de2212acdd40b1cc1aafbe09da8c92933b911d19da3302
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_Declare(
        msgpack
        URL https://github.com/msgpack/msgpack-c/releases/download/cpp-4.1.1/msgpack-cxx-4.1.1.tar.gz
        URL_HASH SHA256=8115c5edcf20bc1408c798a6bdaec16c1e52b1c34859d4982a0fb03300438f0b
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    set(msgpack_MSGPACK_CXX20 ON)
    set(msgpack_MSGPACK_USE_BOOST OFF)
    set(msgpack_MSGPACK_BUILD_DOCS OFF)

    FetchContent_Declare(
        tinycbor
        URL https://github.com/intel/tinycbor/archive/refs/tags/v0.6.0.tar.gz
        URL_HASH SHA256=512e2c9fce74f60ef9ed3af59161e905f9e19f30a52e433fc55f39f4c70d27e4
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_Declare(
        sodium
        URL https://download.libsodium.org/libsodium/releases/libsodium-1.0.18-stable.tar.gz
        URL_HASH SHA256=56d862e8484e8a140d05860f7f1940cb19cb8ec1da1b1c33a9a93288d1e247fc
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    # https://www.boost.org/users/history/version_1_79_0.html
    FetchContent_Declare(
        boost
        URL https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.tar.gz
        URL_HASH SHA256=273f1be93238a068aba4f9735a4a2b003019af067b9c183ed227780b8f36062c
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.tar.gz
        URL_HASH SHA256=81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2
        #OVERRIDE_FIND_PACKAGE New in 3.24
    )

    FetchContent_MakeAvailable(googletest boost spdlog toml json tinycbor sodium)
else()
    message(STATUS "Dependencies are not handled by Conan or FetchContent.")
endif()
