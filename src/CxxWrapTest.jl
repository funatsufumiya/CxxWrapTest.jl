module CxxWrapTest

module CppHello
  using CxxWrap
  @wrapmodule(() -> normpath(joinpath(@__DIR__, "..", "lib","libgreet")))

  function __init__()
    @initcxx
  end
end

function main()
    println(CppHello.greet())
end

end # module CxxWrapTest
