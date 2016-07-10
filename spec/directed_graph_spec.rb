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
      expect(@directed_graph.nodes[6].to eq 6
    end

    it 'chains adding together' do
      expect(@directed_graph.add_node(6).add_node(7)).to_not raise_error
    end

    it 'deletes a node' do
      @directed_graph.delete_node(1)
      expect(@directed_graph.nodes[1]).should be_nil
    end

    it 'gets node value from node_id' do
      expect(@directed_graph.get_node_value(1)).to eq 1
    end

    it 'sets the node value' do
      @directed_graph.set_node_value(1, 2)
      expect(@directed_graph.get_node_value(1)).to eq 2
    end

    it 'adds an edge to a node' do
      @directed_graph.add_edge(1, 5)
      expect(@directed_graph.nodes[1].edges).to eq [2, 5]
    end

    it 'deletes an edge from a node' do
      @directed_graph.delete_edge(1, 2)
      expect(@directed_graph.nodes[1].edges).to eq []
    end

    it 'tells if two nodes are adjacent' do
      expect(@directed_graph.adjacent(1, 2)).to eq true
    end

    it 'lists all neighbors for a given node' do
      expect(@directed_graph.neighbors(1)).to eq [2]
    end
  end
end
