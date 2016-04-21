require_relative 'graph'
require_relative 'node'

class UndirectedGraph < Graph

  def add_node(value, edges=[])
    super
    edges.each { |edge| add_edge(edge, node.id) }
    self
  end

  def delete_node(node_id)
    all_edges = @nodes[node_id].edges
    all_edges.each { |edge| delete_edge(node_id, edge) }
    super
  end

  #works
  def add_edge(node_id, edge)
    super
    @nodes[edge].edges << node_id
  end

  def delete_edge(node_id, edge)
    @nodes[node_id].edges.delete(edge)
    @nodes[edge].edges.delete(node_id)
    # edges_to_delete.each { |edge| @nodes[node_id].edges.delete(edge) }
    # edges_to_delete.each { |edge| @nodes[edge].edges.delete(node_id) }
    # super
  end
end

graph = UndirectedGraph.new

7.times {graph.add_node(nil)}

File.open("test.txt").each_line do |line|
  node_id = line.split(' ')[0].to_i
  edge = line.split(' ')[1].to_i
  graph.add_edge(node_id, edge)
end

# puts graph.nodes
# puts graph.nodes[2].edges
# graph.nodes[2].edges.each { |edge| graph.delete_edge(edge, 2) }
# graph.delete_edge(2, 0)
# graph.delete_edge(2, 5)
# graph.delete_edge(2, 6)


graph.delete_node(2)
puts graph.nodes

# node_id = 0
# target_node = 6
# puts "Breadth first: #{graph.breadth_first_search(node_id, target_node)}"
