# nsens

## Build

```bash
$ mkdir build && cd build
$ conan profile update settings.compiler.libcxx=libstdc++11 default
$ conan install .. --build=missing
$ cmake .. -G Ninja -DCMAKE_INSTALL_PREFIX=$HOME/usr/local -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Debug
$ cmake --build .
$ ctest
$ cmake --install .
```
