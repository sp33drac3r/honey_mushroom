class DirectedGraph #< Graph

  Node = Struct.new(:value)

  attr_accessor :edges

  def initialize
    @nodes = {}
    @edges = {}
  end

  def add(value, node_id, edges=Array.new)
    node = Node.new(value)
    @nodes[node_id] = node
    @edges[node_id] = edges
    self
  end

  def delete(node_id)
    node = @nodes[node_id]
    @nodes[node_id] = nil
    @edges.delete(node)
  end

  def delete_edge(node_id, *edges)\
    alledges = @edges[node_id]
    edges.each {|edge| alledges.delete(edge)}
  end

  def get_node_value(node_id)
    @node[node_id].value
  end

  def set_node_value(node_id, value)
    @nodes[node_id].value = value
  end

  def add_edge(x, y)
    @edges[x] << y
  end

  def adjacent?(x, y)
    return true if @edges[x].include?(y) || @edges[y].include?(x)
    false
  end

  def neighbours(node_id)
    @edges[node_id]
  end

  def to_s
    s = ""
    @nodes.each do |node_id, node|
      s += "#{node_id} (#{node.value}) => #{@edges[node_id]} \n"
    end
    return s
  end
end

graph = DirectedGraph.new
graph.add("James", 1).add("Tim", 2, [1]).add("Tom", 3, [1])
graph.add_edge(1, 3)
puts graph.to_s
puts graph.adjacent?(1, 2)
