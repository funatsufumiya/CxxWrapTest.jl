# CppWrapTest.jl

Simple C++ call test from Julia using CxxWrap.jl

## Usage

### 1. build cpp code (using CMake)

```bash
$ cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=C:/Users/xxx/.julia/dev/libcxxwrap_julia_jll/override -DJulia_EXECUTABLE=/path/to/bin/julia.exe cpp_src
$ cmake --build build --config Release --parallel 8 -j 8

# finally copy dll, so, dylib into lib dir
# NOTE: you can find it by `fd -uu .dll$ build`
```

NOTE: `-DCMAKE_PREFIX_PATH=xxxx` can be found by `julia --project=@. -e 'using CxxWrap; print(CxxWrap.prefix_path())'`. This command prints the `/path/to/libcxxwrap_julia_jll/override` then please set it to `-DCMAKE_PREFIX_PATH=/path/to/libcxxwrap_julia_jll/override`

### 2. run julia code

```bash
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
$ julia --project=@. -e 'using CxxWrapTest; CxxWrapTest.main();'
# Hello from C++!!
```