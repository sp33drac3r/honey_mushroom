require_relative '../lib/honey_mushroom/directed_graph'
require_relative '../lib/honey_mushroom/undirected_graph'

describe BreadthFirstSearch do
  context 'directed graph' do
    before(:each) do
      @directed_graph = DirectedGraph.new
      [0,1,2,3,4,5].each { |id| @directed_graph.add_node(id) }
      [0,1,2,3,4].each { |id| @directed_graph.add_edge(id, id + 1) }
      p @directed_graph.to_s
    end

    it 'correctly finds a related node' do
      expect(@directed_graph.breadth_first_search_include?(1, 4)).to eq true
    end

    it 'does returns false for unrelated nodes' do
      expect(@directed_graph.breadth_first_search_include?(4, 1)).to eq false
    end

    it 'it does not visit the same node twice' do

    end
  end

  context 'undirected graph' do
    before(:each) do
      @undirected_graph = UndirectedGraph.new
      [1,2,3,4].each { |id| @undirected_graph.add_node( id, [1,2,3,4].reject { |el| el == id }) }
    end

    it 'correctly finds a related node' do
    end

    it 'does not search the same node twice' do
    end
  end
end
