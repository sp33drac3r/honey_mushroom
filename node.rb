class Node
  @@auto_increment = 0
  attr_reader :id
  attr_accessor :value,  :edges,  :next,
                :value2, :value3, :value4

  def initialize(args={})
    @value  = args.fetch(:value, nil)
    @edges  = args.fetch(:edges, nil)  if args.include?(:edges)
    @next   = args.fetch(:next, nil)   if args.include?(:next)
    @id     = args.fetch(:id, @@auto_increment)

    @value2 = args.fetch(:value2, nil) if args.include?(:value2)
    @value3 = args.fetch(:value3, nil) if args.include?(:value3)
    @value4 = args.fetch(:value4, nil) if args.include?(:value4)
    @prev   = args.fetch(:prve, nil)   if args.include?(:prev)

    @@auto_increment += 1
  end
end
