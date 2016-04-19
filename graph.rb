class Graph

	Node = Struct.new(:value)

  attr_accessor :edges

	def initialize
		@nodes = {}
		@edges = {}
	end
end