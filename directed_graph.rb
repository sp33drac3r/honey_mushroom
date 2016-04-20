require_relative 'graph'
require_relative 'node'

class DirectedGraph < Graph

  def add(value, edges=[])
    node = Node.new(value, edges)
    @nodes[node.id] = node
    self
  end

  def delete(node_id)
    @nodes.delete(node_id)
  end

  def delete_edge(node_id, *edges_to_delete)
    edges_to_delete.each {|edge| @nodes[node_id].edges.delete(edge)}
  end

  def add_edge(node_id, edge)
    @nodes[node_id].edges << edge
  end
end

# graph = DirectedGraph.new

# 10.times {graph.add(nil)}

# File.open("test.txt").each_line do |line|
#   node_id = line.split(' ')[0].to_i
#   edge = line.split(' ')[1].to_i
#   graph.add_edge(node_id, edge)
# end


# node_id = 0
# target_node = 6
# puts "Depth first: #{graph.depth_first_search(node_id, target_node)}"
# puts "Breadth first: #{graph.breadth_first_search(node_id, target_node)}"
