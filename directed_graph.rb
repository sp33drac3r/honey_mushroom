require_relative 'graph'
class DirectedGraph < Graph; end


trust_network = DirectedGraph.new

100000.times {trust_network.add_node(nil)}

File.open('test-data/full_data_set_soc-Epinions.txt').each do |line|
  line_arr = line.split(" ")
  trust_network.add_edge(line_arr[0].to_i, line_arr[1].to_i)
end

# trust_network.delete_edge(0, 71400)

p trust_network.adjacent?(0, 112)

p trust_network.neighbors(0)
