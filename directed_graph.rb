class DirectedGraph #< Graph

  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add(value, edges=[])
    node = Node.new(value, edges)
    @nodes[node.id] = node
    self
  end

  def delete(node_id)
    @nodes.delete(node_id)
  end

  def delete_edge(node_id, *edges_to_delete)\
    alledges = @nodes[node_id].edges
    edges_to_delete.each {|edge| alledges.delete(edge)}
  end

  #done
  def get_node_value(node_id)
    @node[node_id].value
  end

  def set_node_value(node_id, value)
    @nodes[node_id].value = value
  end

  def add_edge(node_id, edge)
    @nodes[node_id].edges << edge
  end

  def adjacent?(node_id, edge)
    @nodes[node_id].edges.include?(edge)
  end

  def neighbours(node_id)
    @nodes[node_id].edges
  end

  def to_s
    s = ""
    @nodes.each do |node_id, node|
      s += "#{node_id} (#{node.value}) => #{node.edges} \n"
    end
    return s
  end
end

class Node
  @@node = 0
  attr_accessor :value, :edges
  attr_reader :id

  def initialize(value, edges)
    @value = value
    @edges = edges
    @id = @@node
    @@node += 1
  end
end

graph = DirectedGraph.new
graph.add("James").add("Tim", [1]).add("Tom", [1])
graph.add_edge(0, 2)
graph.add_edge(1, 2)
puts graph.to_s
puts graph.adjacent?(1, 2)
