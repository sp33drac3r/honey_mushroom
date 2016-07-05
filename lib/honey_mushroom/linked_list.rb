require 'honey_mushroom/node'

class LinkedList
  attr_accessor :head
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

  def find(target)
    current = @head
    until current.value == target
      current = current.next
    end

    return "Value: #{current.value}  Next: #{current.next}  ID: #{current.id}"
  end
end
