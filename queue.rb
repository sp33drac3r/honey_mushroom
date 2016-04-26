class Queue
  def initialize
    @queue = []
  end

  def enqueue(value)
    @queue.push(value)
    return value
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

  #shorthand = less typing =)
  def enq(value)
    enqueue(value)
  end

  #shorthand = less typing =)
  def dq
    dequeue
  end
end
