require_relative 'graph'
require_relative 'node'

class DirectedGraph < Graph; end

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
