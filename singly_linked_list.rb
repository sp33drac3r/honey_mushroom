require_relative 'node'

class SinglyLinkedList #< LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def add(value)
    node = Node.new({value: value, next: nil})
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
    current = current.next until current.next.next.nil?
    node = current.next
    current.next = nil

    return node
  end

  def find(value)
    current = @head
    until current.value == value
      current = current.next
    end

    return "Value: #{current.value}  Next: #{current.next.value}  ID: #{current.id}"
  end

  def to_s
    s = ''
    current = @head
    until current.nil?
      s += "[#{current.value}]->"
      current = current.next
    end

    return s
  end
end
