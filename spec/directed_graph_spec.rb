require_relative '../lib/honey_mushroom/directed_graph'

describe DirectedGraph do
  context 'Directed Graph is no different from the Graph base class' do
    before(:each) do
      @directed_graph = DirectedGraph.new
      [0,1,2,3,4,5].each { |value| @directed_graph.add_node(value) }
      [0,1,2,3,4].each { |value| @directed_graph.add_edge(value, value + 1) }
    end

    it 'adds a node' do
      @directed_graph.add_node(6)
      expect(@directed_graph.nodes[6].value).to eq 6
    end

    it 'chains adding together' do
      expect(@directed_graph.add_node(6).add_node(7)).to_not raise_error
    end
  end
end
