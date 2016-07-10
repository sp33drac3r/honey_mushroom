require_relative '../lib/honey_mushroom/linked_list'

describe LinkedList do
  context 'linked list base class' do
    before(:each) do
      @linked_list = LinkedList.new
      @linked_list.add(1)
    end

    it 'does not point @head to nil on a list that is not empty' do
      expect(@linked_list.head).to_not eq nil
    end

    it 'sets head to new node when a value is added' do
      expect(@linked_list.head.value).to eq 1
    end

    it 'finds the droids youre looking for' do
      expect(@linked_list.find(1)).to be_kind_of(String)
    end

    it 'removes node from the front' do
      expect {@linked_list.remove_front}.to change{@linked_list.head}
    end

  end
end
