**The ADT Dictionary**
* Main operation: looking up entries based on a search key  
* Each entry is a key-value pair
![[Pasted image 20231205215210.png]]

**Example**
* Look up population of a given city
![[Pasted image 20231205215231.png]]

**The ADT Dictionary**
![[Pasted image 20231205215248.png]]

**Possible Implementations**
* Array-based  
	– Sorted or unsorted by search key  
* Linked-based  
	– Sorted or unsorted by search key
![[Pasted image 20231205215315.png]]

**Possible Implementations**
* Use binary search tree
![[Pasted image 20231205215336.png]]

**Average-case cost**
![[Pasted image 20231205215351.png]]

**Hash Table**
![[Pasted image 20231205215405.png]]
![[Pasted image 20231205215417.png]]

**Three factors in Hash Table**
* Hash function  
* Size of the table  
* Collision handling

**Hash function**
* Hash function should  
	– Be easy, fast to compute  
	– Place entries evenly throughout hash table
![[Pasted image 20231205215532.png]]

**Hash function for integer keys**
* Simple hash function
* h(key) = key % tableSize
![[Pasted image 20231205215601.png]]

**Hash function for string keys**
* Add up character ASCII values (0-127) to produce integer keys  
	– “abcd” = 97+98+99+100 = 394  
	– h(“abcd”) = 394 % TableSize  
* Problems  
	– Hash function output may not be large enough  
	– Anagrams will map to the same index  
* h(“abcd”) = h(“dbac”)

**Hash function for string keys**
![[Pasted image 20231205215717.png]]

**Java hashcode()**
* Java 1.2  
* hashcode() method in java.lang.String class  
	– uses the entire string  
	– n: length of the string  
	– s[i]: the i’th character in the string
![[Pasted image 20231205215754.png]]

**Horner’s Rule**
* Horner’s rule minimizes the number of computations.  
* Instead of computing it directly
![[Pasted image 20231205215824.png]]
* Compute it this way
![[Pasted image 20231205215838.png]]

**Size of hash table**
* Always use a prime number to be size of hash table  
* Helps to evenly distributes keys into table  
* Reduce the number of collisions

**Collisions**
* When two keys produce same hash value  
	– h(x) = h(y)  
* How often do collisions occur?
![[Pasted image 20231205220007.png]]

**Brithday Paradox**
* How many people do you need such that the probability of two people having the same birthday is greater than 50%?
![[Pasted image 20231205220039.png]]

**Chance of Collision**
![[Pasted image 20231205220059.png]]

Next Lecture 
[[Lecture 24 Dictionaries Part 2]]
