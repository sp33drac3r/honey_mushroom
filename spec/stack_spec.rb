require_relative '../lib/honey_mushroom/stack'

describe Stack do
  context 'simple stack class' do
    before(:each) do
      @stack = Stack.new
    end

    it 'can chain push operations together' do
      @stack.push(1).push(2).push(3).push(4)
      expect(@stack.stack.length).to eq 4
    end
  end
end
