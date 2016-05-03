Gem::Specification.new do |s|
  s.name        = 'honey_mushroom'
  s.version     = '0.0.1'
  s.default_executable = 'honey_mushroom'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors       = ["Riley Scheid"]
  s.date          = %q{2016-05-04}
  s.description   = %q{Honey Mushroom builds and traverses common abstract data structures in Ruby}
  s.email         = %q{riley.k.scheid@gmail.com}
  s.files         = ["lib/honey_mushroom.rb",
                     "lib/honey_mushroom/binary_search_tree.rb",
                     "lib/honey_mushroom/breadth_first_search.rb",
                     "lib/honey_mushroom/depth_first_search.rb",
                     "lib/honey_mushroom/directed_graph.rb",
                     "lib/honey_mushroom/doubly_linked_list.rb",
                     "lib/honey_mushroom/linked_list.rb",
                     "lib/honey_mushroom/node.rb",
                     "lib/honey_mushroom/queue.rb",
                     "lib/honey_mushroom/singly_linked_list.rb",
                     "lib/honey_mushroom/stack_queue.rb",
                     "lib/honey_mushroom/stack.rb",
                     "lib/honey_mushroom/undirected_graph.rb"]
  s.homepage      = 'http://www.github.com/sp33drac3r/honey_mushroom'
  s.test_files    = ["rsepc/binary_search_tree_spec.rb"]
  s.require_paths = ["lib"]
end

