module BreadthFirstSearch

  def breadth_first_search_include?(node_id, target_node)
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