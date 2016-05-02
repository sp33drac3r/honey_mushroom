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

  def enq(value) #shorthand = less typing =)
    enqueue(value)
  end

  def dq #shorthand = less typing =)
    dequeue
  end
end
