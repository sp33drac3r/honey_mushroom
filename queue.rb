class Queue

  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(value)
    @queue.push(value)
  end

  def dequeue
    return @queue.pop
  end
end
