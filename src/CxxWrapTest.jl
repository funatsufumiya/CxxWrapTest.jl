module CxxWrapTest

module CppHello
  using CxxWrap
  @wrapmodule(() -> joinpath("lib","libgreet"))

  function __init__()
    @initcxx
  end
end

function main()
    println(CppHello.greet())
end

end # module CxxWrapTest
