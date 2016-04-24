module DepthFirstSearch
  
  def depth_first_search_include?(node_id, target_node, visited_nodes=Hash.new {0})
    return true if node_id == target_node
    @nodes[node_id].edges.each do |child|
      visited_nodes[child] += 1
      return false if visited_nodes[child] >= 2
      result = depth_first_search(@nodes[child].id, target_node, visited_nodes)
      return true unless result == false
    end
    false
  end

end