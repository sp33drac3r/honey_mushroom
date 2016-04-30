class BinarySearchTree

  def initialize(value=nil)
    @head = Node.new(value)
  end

  def search(node=@head, value)
    if node.value == value
      return node.value
    elsif value < node.value
      return search(value.left)
    else
      return search(value.right, value)
    end
  end

  def insert(node=@head, value)
    if node.value < value && node.left.nil?
      node.left = Node.new(value)
    elsif node.value > value && node.left.nil?
      node.right = Node.new(value)
    elsif node.value < value
      insert(node.right, value)
    else
      insert(node.left, value)
    end
  end
end

class Node
  def initialize(value=nil)
    @value = value
    @right = nil
    @left = nil
  end
end
