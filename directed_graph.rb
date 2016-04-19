
class DirectedGraph #< Graph

  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add(value, edges=[])
    node = Node.new(value, edges)
    @nodes[node.id] = node
    self
  end

  def delete(node_id)
    @nodes.delete(node_id)
  end

  def delete_edge(node_id, *edges_to_delete)
    all_edges = @nodes[node_id].edges
    edges_to_delete.each {|edge| all_edges.delete(edge)}
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
    #find a fast way to get id from value
    #returns an array of all node ids with a given value
  end

  def depth_first_search(node_id, target_node, visited_nodes=Hash.new(0))
    return true if node_id == target_node
    @nodes[node_id].edges.each do |child|
      visited_nodes[child] += 1
      return nil if visited_nodes[child] == 2
      result = breadth_first_search(@nodes[child], target_node, visited_nodes)
      return true unless result.nil?
    end
    nil
  end

  def breadth_first_search(node_id, target_node visited_nodes=Hash.new(0))
    queue = []
    queue << @nodes[node_id].id
    visited_nodes[node_id] += 1
    until queue.empty?
      id = queue.shift
      if id == target_node
        true unless visited_nodes[id] == 2
      else
        queue.push(@nodes[id].edges)
      end
    end
    false
  end
end


class Node
  @@node = 0
  attr_accessor :value, :edges
  attr_reader :id

  def initialize(value, edges)
    @value = value
    @edges = edges
    @id = @@node
    @@node += 1
  end
end

graph = DirectedGraph.new
graph.add("James").add("Tim", [1]).add("Tom", [1])
graph.add_edge(0, 2)
graph.add_edge(1, 2)
puts graph.to_s
puts graph.adjacent?(1, 2)
