require_relative 'node'

class SinlglyLinkedList #< LinkedList
  attr_reader :head
  def initialize
    @head = Node.new({value: value})
  end

  def add(value)
    node = Node.new({value: value})
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
