class Stack

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(value)
    @stack.push(value)
  end

  def pop
    return @stack.pop
  end
end
