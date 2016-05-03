#Honey Mushroom
Graph theory is "the study of nodes (vertices) connected in pairs by edges."<sup>[[1]](https://en.wikipedia.org/wiki/Glossary_of_graph_theory)</sup> Though simple enough to describe, graphs can be a devil to implement. Honey Mushroom builds and traverses these abstract data structures in Ruby.

None of the data structures in this gem are best expressed in Ruby. C programming language, for example, is much better suited to model a queue, using pointers to create a linked list. In fact, using Ruby's array class to model these data-types unnecessarily limits Ruby's array functionality. Furthermore, using Ruby objects to model nodes and edges makes these graphs needlessly space inefficient. These downsides are balanced by Ruby's exceedingly accessible syntax, making the implementation of these graphs easy to understand.

##Data Types Included
* Graph superclass
* Directed Graph (edges have a direction and can only be traversed in said direction)
* Undirected Graph (edges have no direction and be traversed freely)
* Binary Search Tree (a tree is just a special kind of graph)
* Linked List (single and double)
* Queue
* Stack
* Stackqueue

##Algorithms
* Depth-first Search (DFS) [wikipedia](https://en.wikipedia.org/wiki/Depth-first_search)
* Breadth-first Search (BFS) [wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search)

##Examples
See [EXAMPLES.md](/EXAMPLES.md/) for examples including all of the data types and algorithms listed above. Each data structure and algorithm listed above.

##Coming Soon
* Iterative Deepening Depth First Search
* Dijkstra's Algorithm

##Contributing
I made this project to teach myself abstract data types and I use it to become better at solving real-world problems using graphs. If you wish to contribute to this project:

1. I <3 you.
2. Fork it, clone it, change it and make a pull request with a clear, detailed description of the change or feature.
3. I'll review and merge it.

Bug reports: https://github.com/sp33drac3r/honey_mushroom/issues

##Armillaria Solidipes
This gem gets it's name from the 'Humongous Fungus,' the largest living organism on earth. A single specimen in the Malheur National Forest in Oregon has been growing for over 2,400 years and covers 3.4 square miles. A massive network of long rhizomorphs traverse between sapwood hosts and, in Autumn, bloom honey mushrooms.
