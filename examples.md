#Code Examples
These examples are listed in order of difficulty. We'll be using dataset from Stanford's [Large Network Dataset Collection](https://snap.stanford.edu/data/) (SNAP) in later examples to model large and complicated network systems.

##Linked List
Linked lists are most useful in low-level programming languages that don't enjoy the luxury of automatic array resizing. They are a useful data structure when you don't know how many items will be in this list, you need constant-time insertion and deletion and you don't need random access to any of the list's elements.
Visit wikipedia's entry on [linked lists](https://en.wikipedia.org/wiki/Linked_list) for more details.

In this example, we're going to make a conga line using a singly linked list. Each node will represent a person and the pointer to next will represent than hands on the shoulders of the person in front of them. For this example to make sense, we have to imagine that the @head is the front of the conga line, and new conga lovers are added to the front, not the back.

```ruby
conga_lovers = ["James", "Tammy", "Arjav", "Shambhavi", "Dre", "Shannon", "Raquel"]
conga_line = SinglyLinkedList.new

conga_lovers.each { |person| conga_line.add(person)}

conga_line.to_s
```

To remove someone from the back of the line, the last person to join the conga, we call
```ruby
conga_line.remove_back
```
Removing a node from the front reassigns the nil pointer to the second person to the front and returns the first node added to the linked list.
```ruby
conga_line.remove_front
```
To find a specific individual in the conga line, say Dre, we use .find
```ruby
conga_line.find("Dre") #=> #<Node:28923858947, @value="Dre", @next="Shambhavi">
```
See [source code](/singly_linked_list.rb/)

##Queue
A queue a FIFO (First In First Out) data structure. A queues is well expressed with a linked list, though it is implemented with an array in this example, where elements are added to the head and removed from the tail or vice versa. A queue is like a line at a bank: the first customer to get in the line is the first customer served. Every element that is added to the queue is dequeued (removed) in the order that they were enqueued.

In this example we're going to to write a program for a printer. This printer is known around the office as Ol' Faithful, so it takes a long time but it's services are in high demand. It's only fair that the first person to send this printer a file is the first person to get their print! To receive these requests we'll use an excellent gem for sending messages over local networks called XXX.

```ruby
require 'somegem'

print_queue = Queue.new

while true
	new_message = port_listen
	print_queue.enqueue(new_message)
end

if printer.idle unless print_queue.empty?
	image = print_queue.dequeue
	printer.idle = false
	printer.print(image)
	printer.idle = true
end
```

The while loop listens for messages over local port and adds them to the print_queue as they come in. If the printer is idle and there are prints in the print queue, the printer is instructed to print the image, switching it's state to unavailable and when it finishes it is available to take the next print in line.
See [source code](/queue.rb/)

##Stack
A stack is a LIFO data structure. Think of a stack like a stack of plates at a restaurant. The last plate placed on top of the stack is the first plate to be used. In this example we'll use two stacks to create a back button and a forward button like on a web browser.

```ruby
back = Stack.new
forward = Stack.new

if browser.load(URL)
	current_page = back.push(URL)
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

This simple web browser has three methods, .load, .back and .forward. Every time a call to .load is made, the browser pushes the URL to that page onto the back stack. If the user calls .back, the last web page visited is brought into view and the page the user was looking at is pushed onto the forward stack. If they user calls the .forward, the last page pushed onto that stack is brought into view and the page the user was looking at is returned to the back stack.
See [source code](/stack.rb/)

##Stackqueue
A stackqueue is a queue made out of two stacks. At first blush it may not be obvious how to make a queue out of two stacks and even less apparent is why one would want to. If you are using a linked list to create your queue, enqueueing will be an O(1) operation but dequeuing will be an 0(n) operation because the whole linked list much be traversed before you can find the node where node.next points to nil. The runtime of enqueuing and dequeueing can be improved by using a stackqueue. Since the end result will be the same as the queue described above, I won't provide a code example here. This implementation of a stackqueue is somewhat anachronistic because the stacks are made of an array, making enqueing and dequeing both an 0(1) operation; however, looking at the source code you can get an understanding of the logic behind implementing a stackqueue.

See [source code](/stack_queue.rb/)

##Directed Graph
In this example, we'll work with real-world data from Stanford's Large Network Dataset Collection. This dataset is from the website Epinions.com, a consumer review website. From the SNAP website, "members of the site can decide whether to 'trust' each other. All the trust relationships interact and form the Web of Trust which is then combined with review ratings to determine which reviews are shown to the user." This graph is a directed graph because trust is not necessarily mutual. At a minimum, a relationship between two nodes has a direction.

Download the dataset from (https://snap.stanford.edu/data/soc-Epinions1.html SNAP, Epinions social network)

| Dataset Stats  |
| ----- | ------ |
| Nodes |	75879  |
| Edges	| 508837 |
 ----------------

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

This dataset comes in a txt file in the form of pairs of node ids. The data is anonymized, so our nodes will contain no values, only ids. First we'll all of the nodes one by one, the data on the left side of the text file, then we'll add their edges, the data on the right.

```ruby
trust_network = DirectedGraph.new

File.open('soc-Epnions.txt').each do |line|
	trust_network.add_node({id: line[0]})
	trust_network.add_edge(line[0], line[1])
end
```

With that, we now have a data structure that accurately models the trust relationships across a subsection of the Epinions website. In this next section, we'll cover different strategies for searching over the nodes and the edges to find trust relationships.

##Breadth-first Search
Breadth-first search is a iterative algorithm for searching over nodes and edges to see if there is a path from one node to another. Breadth first search moves out from the root node in a wave-like pattern, searching all of the nearest nodes first and then the next nearest and so forth.

Let's see if we can find a path from one user to the next. In the context of this graph, a link from one node to another could be used to simulate the trustworthiness of someone we don't know. If we believe that people we trust are likely to truth other people who we can also trust, through the transitive property, we know that we can trust an individual if we can find a trust-path from us to them.

Assuming the node id that represents us is id: 234, let's see if we can trust the user with id: 5361.

```ruby
breadth_first_search_include?(234, 5361)
```

##Undirected Graph
An undirected is simply a graph where the edges have no direction. These graphs model relationships where, if a relationship exists between two nodes, then you can traverse from one node to the other and back again. Think of it like a handshake. You can't shake someone's hand without them also shaking your hand.

In this example we're going to model the social network Friendster. Each node represents a person and each edge represents a confirmed friend request.

```ruby
friendster_network = UndirectedGraph.new

File.open('com-friendster.ungraph.txt').each do |line|
	friendster_network.add_node({id: line[0]})
	friendster_network.add_edge(line[0], line[1])
end
```
This dataset is properly massive, with over 65 million users and almost two trillion friendships.

| Dataset Stats      |
| ----- | ---------- |
| Nodes |	65608366   |
| Edges	| 1806067135 |
 --------------------

Note: this may take a while to run and may use a large portion of your computer's RAM. Social networking sites use computers much larger than your home laptop to model their users and user-relationships.

##Depth-first Search
Depth-first search is a good choice for problems where the solutions are known to be far away from the beginning node, deep in the graph. This is because depth first search recursively searches down a line of child nodes until it can search no further. If it does not find it's solution at the leaf node, it returns to the most recent node with children and searches down that path to the leaf. Depth-first search can be more space efficient breadth-first search if the tree is very wide. This is because, breadth-first search enqueues all of the children of a node if that node is not the node it's looking for, which can become a very long list of children if the graph is very wide.

Let's say we're on Friendster and we also know the Kevin Bacon is on Friendster, we know our user id is 234 and his user id is 53610209. We want to find out how many degrees of separation stand between us and Kevin Bacon.

```ruby
depth_first_search_count(234, 53610209)
```

We're no celebrity and know one we know knows him, so it's reasonable to suggest that there may be many degrees of separation between us. Because we know that we won't be looking for nodes near to us and our dataset is very large, depth-first search is the right strategy in this case.

##Binary Search Tree



##Iterative Deepening Depth First Search


##Weighted Graph
A weighted graph can be a either directed or undirected. A weighted graph is different only in that there is a cost to traversing an edge. For example, if we're modeling all the world's air travel, where each airport is a node and each flight path is an edge, the weight of the edges might be the distance between these two points. Let's say you were not only modeling all of the air travel, but car travel, train and boat travel as well. A weighted graph could be used to find the least costly route from one place to another using a combination of air, boat, train and road travel. If there were a weight for cost and also a weight for time, you could also find the fastest route or a balance between the fastest and the most cost effective.

```ruby
put driver code here
```

##Dijkstra's Algorithm
Figure out what this is and how it works.







