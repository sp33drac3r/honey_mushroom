#Code Examples
These examples are listed in order of easiest to understand to most difficult. In the later examples involving graphs, we will be using dataset from Stanford's (https://snap.stanford.edu/data/ Large Network Dataset Collection) (SNAP).

##Linked List
Linked lists are used in lower level languages that don't have the luxury of automatic array resizing. They are a useful data structure when you don't know how many items will be in this list, you need constant-time insertion and deletion and you don't need random access to any of the list's elements.
Visit wikipedia's on (https://en.wikipedia.org/wiki/Linked_list linked lists) for a more thorough understanding.

In this example, we're going to make a conga line, using a singly linked list. Each node will represent a person and the pointer to next, will represent than hands on the shoulders of the person in front of them.

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
|-------|--------|
| Nodes |	75879  |
| Edges	| 508837 |

This dataset comes in a txt file in the form of pairs of node ids. The data is anonymized, so our nodes will contain no values, only ids. First we'll all of the nodes one by one, the data on the left side of the text file, then we'll add their edges, the data on the right.

```ruby
trust_network = DirectedGraph.new

File.open('soc-Epnions.txt').each do |line|
	trust_network.add_node({id: line[0]})
	trust_network.add_edge(line[0], line[1])
end
```

With that, we now have a data structure that accurately models the trust relationships across a subsection of the Epinions website. In this next section, we'll cover different strategies for searching over the nodes and the edges to find trust relationships.

##Breadth First Search
Breadth first search is a iterative algorithm for searching over nodes and edges to see if there is a path from one node to another. Breadth first search moves out from the root node in a wave-like pattern, searching all of the nearest nodes first and then the next nearest and so forth.

##Undirected Graph


##Depth First Search


##Weighted Graph




##Dijkstra's Algorithm


##Mixed Graph



##Iterative Deepening Depth First Search




