require_relative 'node'
class Graph

  attr_accessor :nodes

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

  # Turns out this is not a good general case search for directed graphs
  # def depth_first_search(node_id, target_node, visited_nodes=Hash.new {0})
  #   return true if node_id == target_node
  #   @nodes[node_id].edges.each do |child|
  #     visited_nodes[child] += 1
  #     return false if visited_nodes[child] >= 2
  #     result = depth_first_search(@nodes[child].id, target_node, visited_nodes)
  #     return true unless result == false
  #   end
  #   false
  # end

  #TODO
  # def iterative_deepening_depth_first_search(node_id, target_node)
  # end

  def breadth_first_search(node_id, target_node)
    queue = []
    visited_nodes = Hash.new(0)
    queue << node_id
    until queue.empty?
      id = queue.shift
      visited_nodes[id] += 1
      if id == target_node && visited_nodes[id] < 2
        return true
      else
        queue.concat(@nodes[id].edges) unless visited_nodes[id] >= 2
      end
    end
    false
  end
end
