
module IterativeDeepeningSearch
  #Iterative Deepening Depth-first Search (IDDFS)

  def iterative_deepening_search_include?(node_id, target_node)
    depth = 0
    while depth < #infitinity
      found = depth_limited_search(node_id, target_node, depth)
      return found unless found.nil?
      depth += 1
    end
  end

  private

  def depth_limited_search(node_id, target_node, depth)
    if depth == 0 && node_id == target_node
      return node_id
    elsif
      @nodes[node_id].edges.each do |edge|
        found = depth_limited_search(edge, target_node, depth - 1)
        return found unless found.nil?
      end
    end
    return nil
  end
end

# Pseudocode
# procedure IDDFS(root)
#     for depth from 0 to ∞
#         found ← DLS(root, depth)
#         if found ≠ null
#             return found

# procedure DLS(node, depth)
#     if depth = 0 and node is a goal
#         return node
#     else if depth > 0
#         foreach child of node
#             found ← DLS(child, depth−1)
#             if found ≠ null
#                 return found
#     return null
