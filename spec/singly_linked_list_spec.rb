require_relative '../lib/honey_mushroom/singly_linked_list'

describe SinglyLinkedList do
  context 'inherits from LinkedList' do
    before(:each) do
      @singly_linked = SinglyLinkedList.new
      @singly_linked.add(1)
      @singly_linked.add(2)
    end

    it 'removes from the back' do
      expect(@singly_linked.remove_back.value).to eq 1
    end
  end
end
