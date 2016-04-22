class Node
  @@node = 0
  attr_accessor :value, :edges, :next
  attr_reader :id

  def initialize(args={})
    @value = args.fetch(:value)
    @edges = args.fetch(:edges)
    @next = args.fetch(:next, nil)
    @id = @@node

    @value2 = args.fetch(:value2)
    @value3 = args.fetch(:value3)
    @value4 = args.fetch(:value4)

    @@node += 1
  end
end
