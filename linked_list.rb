class SinlglyLinkedList
  def initialize
    @head = Node.new(value)
  end

  def add(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end

  def remove_front
    current = @head
    @head = current.next
    return current
  end

  def remove_back
    current = @head
    until current.next.next == nil
      current = current.next
    end
    node = current.next
    current.next = nil
    return node
  end

  def find(value)
    current = @head
    until current.value == value
      current = current.next
    end
    return current
  end
end

class Node

  attr_reader :value
  attr_accessor :next

  def initialize(args={})
    @value = args.fetch(:value)
    @next = args.fetch(:next, nil)

    @value2 = args.fetch(:value2)
    @value3 = args.fetch(:value3)
    @value4 = args.fetch(:value4)
  end
end
