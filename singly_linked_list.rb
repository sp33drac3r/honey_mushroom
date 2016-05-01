require_relative 'node'
require_relative 'linked_list'

class SinglyLinkedList < LinkedList

  def remove_back
    current = head
    current = current.next until current.next.next.nil?
    node = current.next
    current.next = nil

    return node
  end

  def to_s
    s = '@head->'
    current = head
    until current.nil?
      s += "[#{current.value}]->"
      current = current.next
    end

    return s
  end
end
