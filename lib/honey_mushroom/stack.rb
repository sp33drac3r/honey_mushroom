class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def push(value)
    stack.push(value)
    self
  end

  def pop
    stack.pop
  end

  def peek
    stack[-1]
  end
end
