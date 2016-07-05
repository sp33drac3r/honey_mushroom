require 'honey_mushroom/stack'

class StackQueue
  attr_accessor :push_stack, :pop_stack
  def initialize
    @push_stack = Stack.new
    @pop_stack = Stack.new
  end

  def enqueue(value)
    push_stack.push(value)
    self
  end

  def dequeue
    if pop_stack.stack.empty?
      pop_stack.push(push_stack.pop) until push_stack.stack.empty?
    end

    pop_stack.pop
  end

  def enq(value) #shorthand = less typing =)
    enqueue(value)
  end

  def dq  #shorthand = less typing =)
    dequeue
  end
end

