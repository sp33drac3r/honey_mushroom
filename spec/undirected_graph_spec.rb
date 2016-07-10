require_relative '../lib/honey_mushroom/undirected_graph'

describe UndirectedGraph do
  context 'is a graph where the edges traverse both directions' do
    before(:each) do
      @undirected_graph = DirectedGraph.new
      [0,1,2,3,4,5].each { |value| @undirected_graph.add_node(value) }
      [0,1,2,3,4].each { |value| @undirected_graph.add_edge(value, value + 1) }
    end

    it 'adds a node and edges and inverse edges too' do
      @undirected_graph.add_node(6, [1])
      expect(@undirected_graph.nodes[1].edges).to include(6)
    end

    it 'dependent destroys edges when a node is deleted' do
      @undirected_graph.delete_node(1)
      expect(@undirected_graph.nodes[2].edges).not_to include(1)
    end

    it 'adds an edge to both sides when an edge is added on one' do
      @undirected_graph.add_edge(1, 3)
      expect(@undirected_graph.nodes[3].edges).to include(1)
    end

    it 'dependent deletes an edge when an edge is deleted from one side' do
      @undirected_graph.delete_edge(1, 2)
      expect(@undirected_graph.nodes[2].edges).not_to include(1)
    end

    end
  end
end
