require_relative '../lib/honey_mushroom/queue'

describe Queue do
  context 'simple queue class' do
    before(:each) do
      @q = Queue.new
    end

    it 'can chain enqueue operations together' do
      @q.enq(1).enq(2).enq(3).enq(4)
      expect(@q.queue.length).to eq 4
    end
  end
end
