**Two approaches to resolve collision**
* Open addressing  
* Separate chaining
![[Pasted image 20231205220148.png]]

**Open Addressing**
* Find a different location in hash table  
	– Linear probing  
	– Quadratic probing  
	– Double hashing  
	– Increase size of hash table

**Linear Probing with h(x) = x mod 101**
![[Pasted image 20231205220225.png]]

**Linear Probling**
* Items tend to cluster together  
	– Primary clustering  
* Increase chance of future collision
![[Pasted image 20231205220301.png]]
![[Pasted image 20231205220316.png]]
* To delete 3658  
	– Cannot remove it from table, may cause future search to fail  
	– Leave it in hash table, mark it as deleted

**Quadratic probing**
![[Pasted image 20231205220356.png]]
* Avoids primary clustering  
* May lead to secondary clustering

**Why table size needs to be prime**
* If table size is not prime, an insertion may fail even if there are lots of empty slots in the table  
* Example  
	– Let table size be 16  
	– Try inserting 0, 16, 32, 48, 64 using quadratic probing

**Double hashing**
![[Pasted image 20231205220515.png]]

**Load factor**
* Measures how full a hash table is
![[Pasted image 20231205220539.png]]
* Example  
	– Table size is 101  
	– Number of items in table is 50  
	– α = 0.5

**The Efficiency of Hashing**
* Linear probing – average number of comparisons
![[Pasted image 20231205220636.png]]

**The Efficiency of Hashing**
* Quadratic probing and double hashing – average number of comparisons
![[Pasted image 20231205220708.png]]
* Generally, for probing hash tables, keep the load factor below 0.5.

**Separate Chaining**
![[Pasted image 20231205220741.png]]

**The Efficiency of Hashing**
* Efficiency of the retrieval and removal operations under the separate-chaining approach
![[Pasted image 20231205220812.png]]
* For chaining table, keep the load factor below 1.0

**The Efficiency of Hashing**
![[Pasted image 20231205220834.png]]

**Rehashing**
* Increase the size of the hash table when load factor is too high  
* Typically expand the table to twice its size  
	– But still prime  
* Needs to reinsert all existing elements into new table  
	– O(n)
![[Pasted image 20231205220914.png]]

**Dictionary Traversal**
* An Inefficient Operation Under Hashing  
* Entries hashed into table[i] and table[i+1] have no ordering relationship  
* Hashing does not support well traversing a dictionary in sorted order  
	– Generally better to use a search tree

**Next Lecture** 
[[Lecture 25 STL Part 1 - Copy]]

