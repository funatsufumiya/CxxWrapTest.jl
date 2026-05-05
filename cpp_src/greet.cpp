#include "jlcxx/jlcxx.hpp"

std::string greet()
{
   return "Hello from C++!!";
}

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
  mod.method("greet", &greet);
}