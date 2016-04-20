require_relative 'graph'
require_relative 'node'

class UndirectedGraph < Graph

  def add_node(value, edges=[])
    super
    edges.each { |edge| add_edge(edge, node.id) }
    self
  end

  def delete_node(node_id)
    @nodes[node_id].edges.each { |edge| delete_edge(edge, node_id) }
    super
  end

  #works
  def add_edge(node_id, edge)
    super
    @nodes[edge].edges << node_id
  end

  def delete_edge(node_id, *edges_to_delete)
    super
    edges_to_delete.each { |edge| @nodes[edge].edges.delete(node_id) }
  end
end

graph = UndirectedGraph.new

10.times {graph.add_node(nil)}

File.open("test.txt").each_line do |line|
  node_id = line.split(' ')[0].to_i
  edge = line.split(' ')[1].to_i
  graph.add_edge(node_id, edge)
end

puts graph.nodes
puts graph.nodes[2].edges
graph.delete_node(2)
puts graph.nodes

node_id = 0
target_node = 6
puts "Breadth first: #{graph.breadth_first_search(node_id, target_node)}"
