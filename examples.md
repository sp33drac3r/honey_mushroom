#Code Examples
These examples are listed in order of easiest to understand to most difficult. In the later examples involving graphs, we will be using dataset from Stanford's (https://snap.stanford.edu/data/ Large Network Dataset Collection) (SNAP).

##Linked List
Linked lists are used in lower level languages that don't have the luxury of automatic array resizing. They are a useful data structure when you don't know how many items will be in this list, you need constant-time insertion and deletion and you don't need random access to any of the list's elements.
Visit wikipedia's on (https://en.wikipedia.org/wiki/Linked_list linked lists) for a more thorough understanding.

In this example, we're going to make a conga line, using a singly linked list. Each node will represent a person and the pointer to next, will represent than hands on the shoulders of the person in front of them.
'''ruby
conga_lovers = ["James", "Tammy", "Arjav", "Shambhavi", "Dre", "Shannon", "Raquel"]
conga_line = SinglyLinkedList.new

conga_lovers.each { |person| conga_line.add(person)}

conga_line.to_s
'''
To remove someone from the back of the line, the last person to join the conga, we call
'''ruby
conga_line.remove_back
'''
Removing a node from the front reassigns the nil pointer to the second person to the front and returns the first node added to the linked list.
'''ruby
conga_line.remove_front
'''
To find a specific individual in the conga line, say Dre, we use .find
'''ruby
conga_line.find("Dre") #=> #<Node:28923858947, @value="Dre", @next="Shambhavi">
'''
See [source code](/singly_linked_list.rb/)
##Queue
##Stack
##Stackqueue
##Directed Graph
##Depth First Search
##Undirected Graph
##Breadth First Search
##Weighted Graph
##Dijkstra's Algorithm
##Mixed Graph
##Iterative Deepening Depth First Search

