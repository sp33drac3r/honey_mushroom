require 'honey_mushroom/node'
require 'honey_mushroom/depth_first_search'
require 'honey_mushroom/breadth_first_search'

class Graph

  attr_accessor :nodes
  include DepthFirstSearch
  include BreadthFirstSearch

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

  def delete_edge(node_id, edge_id)
    @nodes[node_id].edges.delete(edge_id)
  end

  def adjacent?(node_id, edge)
    @nodes[node_id].edges.include?(edge)
  end

  def neighbors(node_id)
    @nodes[node_id].edges
  end

  #FIXIT: to_s broken for undirected graph
  def to_s
    s = ""
    @nodes.each do |node|
      s += "#{node.id} (#{node.value}) => #{node.edges} \n"
    end
    return s
  end

  def get_id_from_value(value)
    #TODO
    #find a fast way to get id from value
    #returns an array of all node ids with a given value
  end
end
