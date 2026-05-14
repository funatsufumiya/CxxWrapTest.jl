# CppWrapTest.jl

Simple C++ call test from Julia using [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl)

## Usage

### 1. [Optional] Build cpp code (using CMake)

**NOTE**: precompiled lib is already included in `lib` folder. You need this process only if you need (for development or for study).

```bash
$ cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=C:/Users/xxx/.julia/dev/libcxxwrap_julia_jll/override -DJulia_EXECUTABLE=/path/to/bin/julia.exe cpp_src
$ cmake --build build --config Release --parallel 8 -j 8

# finally copy dll, so, dylib into lib dir
# NOTE: you can find it by `fd -uu .dll$ build`
```

NOTE: `-DCMAKE_PREFIX_PATH=xxxx` can be found by `julia --project=@. -e 'using CxxWrap; print(CxxWrap.prefix_path())'`. This command prints the `/path/to/libcxxwrap_julia_jll/override` then please set it to `-DCMAKE_PREFIX_PATH=/path/to/libcxxwrap_julia_jll/override`. Julia executable path can be get by `$(which julia)`

#### Windows libcxxwrap_julia_jll build

> [!NOTE]
> If you have problems when rung CxxWrapTest or CxxWrap on Windows, try this method.

If you have problem running below in Windows, try [Building libcxxwrap-julia](https://github.com/JuliaInterop/libcxxwrap-julia#building-libcxxwrap-julia). And please put Override.toml at `C:/Users/xxxx/.julia/artifacts/Overrides.toml` having this:

```toml
[3eaa8342-bff7-56a5-9981-c04077f7cee7]
libcxxwrap_julia = "C:/Users/xxxx/.julia/dev/libcxxwrap_julia_jll/override"
```

> [!NOTE]
> if you have error on cmake configure of libcxxwrap_julia_jll/override, please consider replace `-DJulia_PREFIX` to `-DJulia_EXECUTABLE`, and please run from x64 Native Tools Command Prompt for VS)

> [!Warning]
> On VS 2026 latest environment, you need latest cmake version such as 4.3.2 (because old version cmake cannot treat `Visual Studio 18 2026`), please install the latest version using `winget install Kitware.CMake`

Then `julia --project=@. -e 'using CxxWrap; print(CxxWrap.prefix_path())'` would point `C:/Users/xxxx/.julia/dev/libcxxwrap_julia_jll/override`. This would make running CxxWrap.jl succeeded.

### 2. Run julia code

```bash
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
$ julia --project=@. -e 'using CxxWrapTest; CxxWrapTest.main();'
# Hello from C++!!
```
