require_relative 'stack'

class StackQueue
  attr_accessor :stack_one, :stack_two
  def initialize
    @stack_one = Stack.new
    @stack_two = Stack.new
  end

  def enqueue(value)
    stack_one.push(value)
  end

  def dequeue
    if stack_two.stack.empty?
      stack_two.push(stack_one.pop) until stack_one.stack.empty?
    end

    stack_two.pop
  end

  def enq(value)
    enqueue(value)
  end

  def dq
    dequeue
  end
end
