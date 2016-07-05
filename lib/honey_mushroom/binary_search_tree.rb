require 'honey_mushroom/node'

class BinarySearchTree

  def initialize
    @head = nil
  end

  def set_head(value)
    @head = Node.new({value: value, left: nil, right: nil})
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

  def delete(value)
    delete_node(value, node=@head)
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

  def delete_node(value, node)
    if value == node
      remove(value)
    elsif node < value
      delete_node(value, node.left)
    else
      delete_node(value, node.right)
    end
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif !node.left.nil? && node.right.nil?
      node = node.left
    elsif node.left.nil? && !node.right.nil?
      node = node.right
    else
      node = change_parant(node)
    end
  end

  def change_parent(node)
    node.value = successor_value(node.right)
    node.right = update(node.right)
    node
  end

  def successor_value(node)
    unless node.left.nil?
      successor_value(node.left)
    end
    node.value
  end

  def update(node)
    unless node.left.nil?
      node.left = update(node)
    end
    node.right
  end

  def insert_left(value, node)
    if node.left
      insert(value, node.left)
    else
      node.left = Node.new({value: value, left: nil, right: nil})
    end
  end

  def insert_right(value, node)
    if node.right
      insert(value, node.right)
    else
      node.right = Node.new({value: value, left: nil, right: nil})
    end
  end
end
