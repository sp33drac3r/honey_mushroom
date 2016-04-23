require_relative '../undirected_graph'

graph = UndirectedGraph.new

7.times {graph.add_node(nil)}

graph.add_edge(0,1)
graph.add_edge(1,3)
graph.add_edge(4,1)
graph.add_edge(2,5)
graph.add_edge(6,2)
graph.add_edge(2,0)
p graph
puts
puts
graph.delete_node(2)
p graph


