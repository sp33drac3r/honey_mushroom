# Allow for a dense or sparse flag to determine if a adjacency list or an adjacency matrix
# should be used. Default to an adjacency list, i.e. "sparse"

class UndirectedGraph #< Graph

  Node = Struct.new(:value)
  Edge = Struct.new(:node1, :node2)

  def initialize
    @nodes = {}
    @edges = {}
  end

  def add(value, node_id, edges=Array.new)
    edges.each {|edge| Edge.new(node_id, edge)}
    node = Node.new(value)
    @nodes[node_id] = node
    @edges[node_id] =
    self
  end

  def delete
  end

  def delete_edge
  end

  def get_node_value
  end

  def set_node_value
  end

  def add_edge
  end

  def to_s
  end

end
# Notes
# A node can be instantiated without any edges
# Any node that has an edge, that edge contains two nodes
ungraph = UndirectedGraph.new
ungraph.add("Portland", 2).add("San Francisco", 1, [2]).add("New York", 3, [1,2])
ungraph.to_s

# ungraph = UndirectedGraph.new
# input_array.each_with_index {|node, i| ungraph.add(node, i)}
