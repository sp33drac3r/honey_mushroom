require_relative '../lib/honey_mushroom/doubly_linked_list'

describe DoublyLinkedList do
  context 'inherits from LinkedList' do
    before(:each) do
      @doubly_linked = DoublyLinkedList.new
      @doubly_linked.add(1)
      @doubly_linked.add(2)
      @doubly_linked.add(3)
    end

    it 'sets next correctly' do
      p @doubly_linked
      expect(@doubly_linked.head.next.value).to eq 2
    end

    it 'sets last correctly' do
      expect(@doubly_linked.tail.last.value).to eq 2
    end

    it 'removes from the back' do
      expect(@doubly_linked.remove_back.value).to eq 1
    end

    it 'removes from the front' do
      expect(@doubly_linked.remove_front.value).to eq 3
    end
  end
end
