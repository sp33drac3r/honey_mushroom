class UndirectedGraph
  def initialize
    @nodes = {}
    @edges = {}
  end

  def add_node(value)
    node = Node.new(value)
    @nodes[node.id] = node
  end

  def delete_node
  end

  def add_edge(node1, node2)
    edge = Edges.new(node1, node2)
    @edges
  end

end

class Node
end

class Edge
  @@auto_increment = 0
  def initialize(node1, node2)
    @pairs = {node1: node2, node2: node1}
    @id = @@auto_increment

    @@auto_increment += 1
  end
end
