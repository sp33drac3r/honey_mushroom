require_relative '../lib/honey_mushroom/node'

describe Node do
  describe 'initialize' do
    context 'it initializes with the correct id' do
      let(:node1) { Node.new({value: 'test node 1' , edges: [1]}) }
      let(:node2) { Node.new({value: 'test node 2' , edges: [0]}) }

      it 'increments node count by one' do
        expect(node1.id).to eq 0
        expect(node2.id).to eq 1
      end
    end
  end
end
