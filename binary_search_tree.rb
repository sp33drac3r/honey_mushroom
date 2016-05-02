class BinarySearchTree

  def initialize(value=nil)
    @head = Node.new(value)
  end

  def set_head(value)
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
    return nil
  end

  def include?(node=@head, value)
    !!search(node, value)
  end

  def insert(node=@head, value)
    if node.value < value
      insert_right(node.right, value)
    elsif node.value > value
      insert_left(node.left, value)
    else
      return false
    end
  end

  def balance!
  end

  def delete(value)
  end


  private

  def insert_left(node, value)
    if self.left
      insert(node.left, value)
    else
      self.left = Node.new(value)
    end
  end

  def insert_right(node, value)
    if self.right
      right.insert(node.right,  value)
    else
      self.right = Node.new(value)
    end
  end
end

class Node
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end
