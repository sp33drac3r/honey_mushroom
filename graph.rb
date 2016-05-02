require_relative 'node'
require_relative 'depth_first_search'
require_relative 'breadth_first_search'
require_relative 'iterative_deepening_depth_first_search'
require_relative 'dijkstras'

class Graph

  attr_accessor :nodes
  include DepthFirstSearch
  include BreadthFirstSearch
  include IterativeDeepeningSearch
  include Dijkstras

  def initialize
    @nodes = {}
  end

  def add_node(value, edges=[])
    node = Node.new({value: value, edges: edges})
    @nodes[node.id] = node
    self
  end

  def delete_node(node_id)
    @nodes.delete(node_id)
  end

  def get_node_value(node_id)
    @node[node_id].value
  end

  def set_node_value(node_id, value)
    @nodes[node_id].value = value
  end

  def add_edge(node_id, edge)
    @nodes[node_id].edges << edge
  end

  def delete_edge(node_id, *edges_to_delete)
    edges_to_delete.each {|edge| @nodes[node_id].edges.delete(edge)}
  end

  def adjacent?(node_id, edge)
    @nodes[node_id].edges.include?(edge)
  end

  def neighbours(node_id)
    @nodes[node_id].edges
  end

  #FIXIT: to_s broken for undirected graph
  def to_s
    s = ""
    @nodes.each do |node_id, node|
      s += "#{node_id} (#{node.value}) => #{node.edges} \n"
    end
    return s
  end

  def get_id_from_value(value)
    #TODO
    #find a fast way to get id from value
    #returns an array of all node ids with a given value
  end
end
