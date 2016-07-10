require_relative '../lib/honey_mushroom/directed_graph'
require_relative '../lib/honey_mushroom/undirected_graph'

describe DepthFirstSearch do
  context 'directed graph' do
    before(:each) do
      @directed_graph = DirectedGraph.new
      [0,1,2,3,4,5].each { |id| @directed_graph.add_node(id) }
      [0,1,2,3,4].each { |id| @directed_graph.add_edge(id, id + 1) }
      p @directed_graph.to_s
    end

    it 'correctly finds a related node' do
      expect(@directed_graph.depth_first_search_include?(1, 4)).to eq true
    end

    it 'returns false for unrelated nodes' do
      expect(@directed_graph.depth_first_search_include?(4, 1)).to eq false
    end

  end

  context 'undirected graph' do
    before(:each) do
      @undirected_graph = UndirectedGraph.new
      [1,2,3,4].each { |id| @undirected_graph.add_node( id, [1,2,3,4].reject { |el| el == id }) }
    end

    it 'correctly finds a related node' do
      expect(@undirected_graph.depth_first_search_include?(1, 4)).to eq true
    end

    it 'returns false for unrelated nodes' do
      @undirected_graph.add_node(6)
      expect(@undirected_graph.depth_first_search_include?(1, 6)).to eq false
    end
  end
end
