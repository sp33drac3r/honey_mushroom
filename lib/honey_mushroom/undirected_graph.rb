require_relative 'graph'

class UndirectedGraph < Graph

  def add_node(value, edges=[])
    node = Node.new({value: value, edges: edges})
    @nodes[node.id] = node
    edges.each { |edge| add_edge(edge, node.id) }
    self
  end

  def delete_node(node_id)
    all_edges = @nodes[node_id].edges.dup
    all_edges.each { |edge| delete_edge(node_id, edge); p edge}
    super
  end

  def add_edge(node_id, edge)
    super
    @nodes[edge].edges << node_id
  end

  def delete_edge(node_id, edge_id)
    @nodes[edge_id].edges.delete(node_id)
    super
  end
end
