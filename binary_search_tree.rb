class BinarySearchTree

  def initialize
    @head = nil
  end

  def set_head(value)
    @head = Node.new(value)
  end

  def search(value, node=@head)
    if value == node.value
      return node.value
    elsif value < node.value
      search(value, node.left) unless node.left.nil?
    elsif value > node.value
      search(value, node.right) unless node.right.nil?
    else
      return nil
    end
  end

  def include?(value, node=@head)
    !!search(value, node)
  end

  #TODO
  def balance!
  end

  #TODO
  def delete(value)
  end

  def insert(value, node=@head)
    if node.value < value
      insert_right(value, node)
    elsif node.value > value
      insert_left(value, node)
    else
      return false
    end
  end

  private

  def insert_left(value, node)
    if node.left
      insert(value, node.left)
    else
      node.left = Node.new(value)
    end
  end

  def insert_right(value, node)
    if node.right
      insert(value, node.right)
    else
      node.right = Node.new(value)
    end
  end
end

class Node
  attr_accessor :value, :right, :left
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end
