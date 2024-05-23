**Recall: The ADT Priority Queue**
* Organize data by priorities  
* Priority value
* Two basic operations  
	– Add an item to queue  
	– Remove the item with highest priority from queue

**The ADT Heap**
* A heap is a complete binary tree with the following condition  
	– Max heap: Each node contains a value >= values in both of its children  
	– Min heap: <=  
	– Note that this is different from BST
![[Pasted image 20231205214315.png]]

**The ADT Heap**
![[Pasted image 20231205214335.png]]
![[Pasted image 20231205214342.png]]

**Array-Based Implementation of a Heap**
![[Pasted image 20231205214359.png]]
![[Pasted image 20231205214406.png]]

**Give the array representation**
![[Pasted image 20231205214419.png]]

**Two basic operations in Heap ADT**
Two basic operations in Heap ADT  
* Add()  
	– Add a new item to heap  
* Remove()  
	– Remove the max (or min) from heap

**Remove max from heap**
![[Pasted image 20231205214514.png]]

**Recursive algorithm to transform semiheap to heap.**
![[Pasted image 20231205214530.png]]
![[Pasted image 20231205214539.png]]

**Efficiency of remove()**
* For a heap with n nodes, the height is log n  
* Worst case scenario  
	– It takes 2 comparisons to go down a level  
	– In worst case it goes down to bottom level  
* Total comparisons: 2 log n -> O(log n)

**Add a new item to heap**
![[Pasted image 20231205214630.png]]
![[Pasted image 20231205214638.png]]

**Efficiency of add()**
* For a heap with n nodes, the height is log n  
* Worst case scenario  
	– It takes one comparison to go up a level  
	– In worst case it goes up to root  
* Total comparisons: log n -> O(log n)

**Array implementation of Max Heap**
![[Pasted image 20231205214717.png]]
![[Pasted image 20231205214725.png]]

**The Implementation**
![[Pasted image 20231205214803.png]]

**Create a heap from a random array**
![[Pasted image 20231205214817.png]]
*Calls heapRebuild() n/2 times  
Efficiency: O(n)*

**Comparing three implementations for Priority Queue** 
* Unsorted array or linked list  
	– Add(): O(1)  
	– Remove(): O(n)  
* Sorted array or linked list  
	– Add(): O(n)  
	– Remove: O(1)  
* Heap  
	– Add(): O(log n)  
	– Remove: O(log n)
![[Pasted image 20231205214909.png]]

**Next Lecture**
[[Lecture 22 Heaps Part 2]]
