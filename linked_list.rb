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

  def find(value)
    current = @head
    until current.value == value
      current = current.next
    end

    return "Value: #{current.value}  Next: #{current.next.value}  ID: #{current.id}"
  end
end
