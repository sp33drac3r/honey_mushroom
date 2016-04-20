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
    #TODOs
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

graph = DirectedGraph.new

10.times {graph.add(nil)}

File.open("test.txt").each_line do |line|
  node_id = line.split(' ')[0].to_i
  edge = line.split(' ')[1].to_i
  graph.add_edge(node_id, edge)
end


node_id = 0
target_node = 6
puts "Depth first: #{graph.depth_first_search(node_id, target_node)}"
puts "Breadth first: #{graph.breadth_first_search(node_id, target_node)}"


