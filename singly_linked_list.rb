require_relative 'node'
require_relative 'linked_list'

class SinglyLinkedList < LinkedList

  def remove_back
    current = @head
    current = current.next until current.next.next.nil?
    node = current.next
    current.next = nil

    return node
  end

  def to_s
    s = '@head->'
    current = @head
    until current.nil?
      s += "[#{current.value}]->"
      current = current.next
    end

    return s
  end
end

conga_lovers = ["James", "Tammy", "Arjav", "Shambhavi", "Dre", "Shannon", "Raquel"]
conga_line = SinglyLinkedList.new

conga_lovers.each { |person| conga_line.add(person)}

p conga_line.to_s
