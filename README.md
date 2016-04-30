#Abstract Data Types
Graph theory is "the study of nodes (vertices) connected in pairs by edges."(https://en.wikipedia.org/wiki/Glossary_of_graph_theory [1]) Though simple enough to describe, graphs can be a devil to implement. [name of gem] builds and traverses these abstract data structures.

None of the data structures in this package are best expressed in Ruby. For instance, C is much better suited to model a a queue, using pointers to create a linked list. In fact, using Ruby's array class to model some of these data-types unnecessarily limits Ruby's array functionality and using Ruby objects to model nodes and edges makes these graphs needlessly space-hungry. That said, Ruby's accessible syntax makes their implementation exceedingly easy to understand. Thus, this gem is primarily for educational purposes.

##Graph Base-types
All specific implementations of a graph are born of two main graph types.
* Directed Graph (edges have a direction and can only be traversed in said direction)
* Undirected Graph (edges have no direction and be traversed freely)

##Graph Sub-types
The two basic graph types above are flexible enough to extend more ridged data structures.
* Weighted Graph (edges have a cost associated with traversal)
* Vertex Labeled Graph
* Mixed Graph
* Bi/n-ary Tree (a tree is just a special kind of graph)
* A/cyclic Graph
* In/finite Graph

##Algorithms
* Depth-first Search (DFS) (https://en.wikipedia.org/wiki/Depth-first_search wikipedia)
* Breadth-first Search (BFS) (https://en.wikipedia.org/wiki/Breadth-first_search wikipedia)
* Iterative Deepening Depth-first Search (IDDFS) (https://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search wikipedia)
* Dijkstra's Algorithm (https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm wikipedia)

##Additional Data-types
* Linked List (single and double)
* Queue
* Stack
* Stackqueue

##Examples
Encapsulate any set of data in one of the structures described above and traverse it for fun or profit! See [examples.md](/examples.md/) for a tutorials using all of the data structures and algorithms listed above.

##Contributing
I made this project to teach myself abstract data types and I use it to become better at solving real-world problems using graphs. If you wish to contribute to this project:
1. I <3 you.
2. Make a pull request with a clear, detailed description of the change or feature.
3. I'll review and merge it.

Bug reports: https://github.com/sp33drac3r/abstact_data_types/issues
