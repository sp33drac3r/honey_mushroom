class Node
  @@node = 0
  attr_accessor :value, :edges
  attr_reader :id

  def initialize(value, edges)
    @id = @@node
    @value = value
    @edges = edges
    @@node += 1
  end
end
