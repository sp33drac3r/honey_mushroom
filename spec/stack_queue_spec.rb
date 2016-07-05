require_relative '../lib/honey_mushroom/stack_queue'

describe StackQueue do
  context 'a queue made of two stacks' do
    before(:each) do
      @stack_q = StackQueue.new
      @stack_q.enq(1).enq(2).enq(3).enq(4)
    end

    it 'can chain push operations together' do
      expect(@stack_q.push_stack.stack.length).to eq 4
    end

    it 'moves all values to the pop stack if empty' do
      expect(@stack_q.pop_stack.stack.empty?).to eq true
      @stack_q.dq
      expect(@stack_q.pop_stack.stack.length).to eq 3
      expect(@stack_q.push_stack.stack.empty?).to eq true
    end
  end
end
