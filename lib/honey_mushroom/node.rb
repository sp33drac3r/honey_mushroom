class Node
  @@auto_increment = 0
  attr_reader :id
  attr_accessor :value,  :edges,  :next, :last, :left,
                :right,  :value2, :value3, :value4

  def initialize(args={})
    @value  = args.fetch(:value,  nil)
    @edges  = args.fetch(:edges,  nil) if args.include?(:edges )
    @next   = args.fetch(:next,   nil) if args.include?(:next  )
    @last   = args.fetch(:last,   nil) if args.include?(:last  )
    @left   = args.fetch(:left,   nil) if args.include?(:left  )
    @right  = args.fetch(:right,  nil) if args.include?(:right )
    @value2 = args.fetch(:value2, nil) if args.include?(:value2)
    @value3 = args.fetch(:value3, nil) if args.include?(:value3)
    @value4 = args.fetch(:value4, nil) if args.include?(:value4)

    @id     = args.fetch(:id, @@auto_increment)

    @@auto_increment += 1
  end
end
