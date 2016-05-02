#Code Examples
These examples are listed in order of difficulty. We'll be using dataset from Stanford's [Large Network Dataset Collection](https://snap.stanford.edu/data/) (SNAP) in later examples to model large and complicated network systems.

##Linked List
Linked lists are most useful in low-level programming languages that don't enjoy the luxury of automatic array resizing. They are a useful data structure when you don't know how many items will be in this list, you need constant-time insertion and deletion and you don't need random access to any of the list's elements.
Visit wikipedia's entry on [linked lists](https://en.wikipedia.org/wiki/Linked_list) for more details.

In this example, we're going to make a conga line using a singly linked list. Each node will represent a person and the pointer to next will represent than hands on the shoulders of the person in front of them. For this example to make sense, we have to imagine that the @head is the front of the conga line, and new conga lovers are added to the front, not the back.

```ruby
conga_lovers = ["Murat", "Rico", "Arjav", "Shambhavi", "Dre", "Shannon", "Raquel"]

conga_line = SinglyLinkedList.new

conga_lovers.each { |person| conga_line.add(person)}

conga_line.to_s #=> "@head->[Raquel]->[Shannon]->[Dre]->[Shambhavi]->[Arjav]->[Rico]->[Murat]->"
```

To remove someone from the back of the line, the first person to join the conga, we call:
```ruby
conga_line.remove_back
```
Removing a node from the front reassigns the nil pointer to the second person to the front and returns the first node added to the linked list.
```ruby
conga_line.remove_front
```
To find a specific individual in the conga line, say Dre, we use .find and pass it the value we're looking for.
```ruby
conga_line.find("Dre") #=> "Value: Dre  Next: Shambhavi  ID: 4"
```
See [source code](/singly_linked_list.rb/)

##Queue
A queue is a FIFO (First In, First Out) data structure. A queues is well expressed with a linked list, though it is implemented with an array in this example, where elements are added to the head and removed from the tail or vice versa. A queue is like a line at a bank: the first customer in the line is the first customer served. Every element that is added to the queue is dequeued (removed) in the order that it was enqueued.

In this example we're going to to write a program for a printer. This printer is known around the office as Ol' Faithful, so it takes a long time but it's services are in high demand. It's only fair that the first person to send their file to the printer is the first person to get their print! To receive these requests we'll use an excellent gem for sending messages over local networks called 'local_network'.

```ruby
require 'local_message'

router = LocaleMessageRouter.new(5000)
router.start
printer = LocalMessageClient.new('localhost', 5000, 'Ol Faithful')
printer.register

print_queue = Queue.new

print_queue.enqueue(printer.listen)

if printer.idle unless print_queue.empty?
	printer.idle = false
	image = print_queue.dequeue
	printer.print(image)
	printer.idle = true
end
```

LocalMessage listens for print jobs over port 5000 and adds them to the print_queue as they come in. If the printer is idle and there are prints in the print queue, the printer is instructed to print the image, switching it's state to unavailable and when it finishes it is available to take the next print in line.

See [source code](/queue.rb/)

##Stack
A stack is a LIFO (Last In, First Out) data structure. Think of a stack like a stack of plates at a restaurant. The last plate placed on top of the stack is the first plate to be used. In this example, we'll use two stacks to create a back button and a forward buttons on an imaginary browser.

This simple, imaginary browser has three methods, .load, .back and .forward. Every time a call to .load is made, the browser pushes the URL to the page it was looking at to the back stack. If the user calls .back, the last web page visited is brought into view with .load and the page the user was looking at is pushed onto the forward stack.

```ruby
back = Stack.new
forward = Stack.new

if browser.load(URL)
	back.push(current_page)
end

if browser.back
	last_page = back.pop
	current_page = browser.load(last_page)
	forward.push(current_page)
end

if browser.forward
	next_page = forward.pop
	current_page = browser.load(next_page)
	back.push(current_page)
end
```

See [source code](/stack.rb/)

##Stackqueue
A stackqueue is a queue made out of two stacks. At first blush, it may not be obvious how to make a queue out of two stacks and even less apparent why one might want to.

The problem with using a linked list to create a queue is that enqueueing will be an O(1) operation but dequeuing will be an O(n) operation because the whole linked list much be traversed before nil pointer node can be found (this true singly, not doubly, linked lists).

A stackqueue is made by enqueing onto one stack and dequeing from the other. For this example, we'll call the enqueue stack the 'Push Stack' and the dequeue stack the 'Pop Stack.' Elements are enqueued onto the Push Stack exclusively. If a dequeue operation is attempted on the Pop Stack and it has nothing to dequeue, all elements elements from the Push Stack are dequed from the Push Stack and enqueued onto the Pop Stack. Then an element is dequeued from the Pop stack. Moving all elements from the Push Stack to the Pop Stack is an expensive operation but, if the cost of that operation is amortized over n operations, the resulting resulting runtime is O(1) for both enqueue and dequeue.

Implementation of a stackqueue in Ruby is somewhat anachronistic because the stacks used are based on the Array class, making enqueing and dequeing both O(1) by default; however, looking at the source code can provide an understanding of the theory behind implementing a stackqueue.

See [source code](/stack_queue.rb/)

##Directed Graph
In this example, we'll work with real-world data from [Stanford's Large Network Dataset Collection](https://snap.stanford.edu/data/). This dataset is from the website Epinions.com, a consumer review website. From the SNAP website, "members of the site can decide whether to 'trust' each other. All the trust relationships interact and form the Web of Trust which is then combined with review ratings to determine which reviews are shown to the user." This graph is a directed graph because trust is not necessarily mutual. At a minimum, a relationship between two nodes has one direction.

Download the dataset from [SNAP, Epinions social network](https://snap.stanford.edu/data/soc-Epinions1.html)

| Deets  | Stats  |
| ------ | ------ |
| Nodes  | 75879  |
| Edges  | 508837 |

This dataset comes in a txt file in the form of pairs of node ids. The data is anonymized, so our nodes will contain no values, only ids. We don't know for sure if we've created the nodes before we try to connect them with an edge, so our strategy with this dataset will be to create as many blank nodes as we know we'll need and then connect them based on the relationships listed in the seed file.

```ruby
trust_network = DirectedGraph.new

100000.times {trust_network.add_node(nil)}

File.open('test-data/full_data_set_soc-Epinions.txt').each do |line|
  line_arr = line.split(" ")
  trust_network.add_edge(line_arr[0].to_i, line_arr[1].to_i)
end
```

The resulting data structure accurately models the trust relationships across a subsection of the Epinions website. To check if two nodes are adjacent call .adjacent? on the graph passing in two nodes of interest. To see all neighbors use .neighbors. The next sections cover different strategies for searching over the nodes and the edges to find relationships between them.

See [source code](/directed_graph.rb/)

##Breadth-first Search
Breadth-first search is a iterative algorithm for searching over nodes and edges to see if there is a path from one node to another. Breadth first search moves out from the root node to all traversable leaf nodes in a wave-like pattern, searching all of the nearest nodes first and then the next nearest and so forth.

Using breadth-first search in the context of the Epinions graph, a link from one node to another could be used to estimate the trustworthiness of an individual based on the known trustworthiness of a specific individual. If it holds true that trustworthy people are likely to truth other people who are also trustworthy, given known people who are trustworthy, a map of trustworthiness could be modeled using breadth-first search.

Graph node at id 0 is known to be trustworthy. Is the individual with idea 71400 trustworthy by the transitive property?

```ruby
trust_network.breadth_first_search_include?(0, 71400)
```
Appears so! What about user at id 70,000?

See [source code](/breadth_first_search.rb/)

##Undirected Graph (NOT DONE)
An undirected is simply a graph where the edges have no direction. These graphs model relationships where, if a relationship exists between two nodes, then you can traverse from one node to the other and back again. Think of it like a handshake: you can't shake someone's hand without them also shaking your hand.

This example models the related products on Amazon. Each node represents a product and the edge between to products that are frequently co-purchased with another product.

```ruby
amazon_products = UndirectedGraph.new

334863.times {amazon_products.add_node(nil)}

File.open('com-amazon.ungraph.txt').each do |line|
  line_arr = line.split(" ")
  amazon_products.add_edge(line_arr[0].to_i, line_arr[1].to_i)
end
```

| Deets  | Stats  |
| ------ | ------ |
| Nodes  | 334863 |
| Edges  | 925872 |

See [source code](/undirected_graph.rb/)

##Depth-first Search
Depth-first search is a good choice for problems where the solutions are known to be far away from the start node, deep in the graph. Depth first search recursively searches down a line of child nodes until it can search no further. If it does not find it's solution at the leaf node, it returns to the most recent node with children and searches down that path to the leaf.

Depth-first search is more space efficient breadth-first search if the tree is very wide. The reason for this is that breadth-first search enqueues all of the children of a node if that node is not the node it's looking for, which can become a very long list of children if the graph is very wide.

Given a large social network, depth-first search would be a good choice for finding the degrees of separation between any one individual and Kevin Bacon. While celebrities rarely have more than a few degrees of separation between themselves and Kevin Bacon, the average Joe will be quite distantly acquainted with Mr. Bacon.

```ruby
my_id = 234
kevin_bacon_id = 53610209

depth_first_search_include?(my_id, kevin_bacon_id)
```

In all likelihood, a large majority of the friend graph will need to be traversed before a path to Kevin Bacon can be found, so depth-first search makes sense for both for runtime and space complexity.

See [source code](/depth_first_search.rb/)

##Binary Search Tree
A binary search tree is a special type of graph - the architecture of any binary search tree is constrained by the values of each node. Binary trees keep there keys in sorted order meaning that any node inserted into the tree is inserted in a specific place: values greater than the root node are inserted onto the right side of the tree and values less than the root node are inserted on the left side of the tree. This pattern continues for each insertion and insertions can only occur as children of leaf nodes. This makes lookups and other operations, in principal, O(log n). For more information, see [binary search tree wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree).

A binary tree can be used to create a set. In computer programming, a set is a data structure where each element in the set is unique. If you have an array = [1,2,3,4,4,3,2] the set of that array would be = [1,2,3,4]. A set data structure created on top of a binary search tree will:

1. Ensure uniqueness
2. Provide o(log n) lookup, insertion and deletion.

```ruby
require 'honey_mushroom'

class Set
  attr_accessor :set
  def initialize
    @set = BinarySearchTree.new
  end

  def insert(value)
    set.insert(value)
  end

  def delete(value)
    set.delete(value)
  end

  def search(value)
    set.search(value)
  end

  def include?(value)
    set.include?(value)
  end
end
```

See [source code](/binary_search_tree.rb/)

##Iterative Deepening Depth First Search
Iterative Deepening Depth First Search is a similar to depth first search but it is combined with a depth limited search. This means that it has the space and performance characteristics of depth first search but the nodes are visited in breadth first order.

This algorithm is an improvement on breadth first search and should be used whenever depth first search is required but depth first search will require too much space to complete.

See [source code](/iterative_deepening_depth_first_search.rb/)

##Weighted Graph
A weighted graph can be a either directed or undirected and is different from those two base-types only in that there is a cost to traversing an edge. The cost is stored in an additional variable in the edge class. if we're modeling all the world's air travel, where each airport is a node and each flight path is an edge, the weight of the edges might be the distance between these two points.

```ruby
put driver code here
```

Let's say you were not only modeling all of the air travel, but car travel, train and boat travel as well. A weighted graph could be used to find the least costly route from one place to another using a combination of air, boat, train and road travel. If there were a weight for cost and also a weight for time, you could also find the fastest route or a balance between the fastest and the most cost effective.

See [source code](/weighted_graph.rb/)

##Dijkstra's Algorithm
Figure out what this is and how it works.

See [source code](/dijkstras.rb/)







