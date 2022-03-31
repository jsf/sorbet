# typed: true
extend T::Sig

sig {params(x: Integer, blk: T.nilable(T.proc.void)).void}
def takes_one_arg(x, &blk)
end

def takes_one_arg_with_kwargs(x, **args)
end

def takes_nothing
end

takes_one_arg(0)
takes_one_arg(0, 0)
#                ^ error: Too many arguments
takes_one_arg(0, 0, 0)
#                ^^^^  error: Too many arguments

takes_one_arg(0) do
  nil
end
takes_one_arg(0, 0) do
  #              ^ error: Too many arguments
  nil
end
takes_one_arg(0, 0, 0) do
  #              ^^^^ error: Too many arguments
  nil
end

takes_one_arg_with_kwargs(1, 2, a: 1)
#                            ^ error: Too many positional
takes_one_arg_with_kwargs(1, 2, 3, a: 1, b: 2)
#                            ^^^^ error: Too many positional

opts = T::Hash[Symbol, Integer].new
takes_nothing(**opts)
