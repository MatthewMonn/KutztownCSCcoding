**Link-Based Structure**
![[Pasted image 20231030102337.png]]
![[Pasted image 20231030102353.png]]
![[Pasted image 20231030102406.png]]
![[Pasted image 20231030102416.png]]

**A Link-Based Implementation of the ADT Bag**
![[Pasted image 20231030102434.png]]
![[Pasted image 20231030102440.png]]

**The Header File**
![[Pasted image 20231030102457.png]]
![[Pasted image 20231030102504.png]]
![[Pasted image 20231030102511.png]]
**Defining the Core Methods**
![[Pasted image 20231030102525.png]]
![[Pasted image 20231030102532.png]]
![[Pasted image 20231030102544.png]]

**Traverse operation**
![[Pasted image 20231030102558.png]]
![[Pasted image 20231030102609.png]]
![[Pasted image 20231030102616.png]]
![[Pasted image 20231030102622.png]]
![[Pasted image 20231030102628.png]]
![[Pasted image 20231030102634.png]]
![[Pasted image 20231030102641.png]]
![[Pasted image 20231030102649.png]]
![[Pasted image 20231030102659.png]]
![[Pasted image 20231030102706.png]]

**Copy constructor**

*  Invoked when  
	– When an object is constructed based on another object of the same class  
	– Pass an object to a function by value  
	– Return an object from a valued function
![[Pasted image 20231030102741.png]]
![[Pasted image 20231030102748.png]]
![[Pasted image 20231030102755.png]]
![[Pasted image 20231030102802.png]]
![[Pasted image 20231030102810.png]]

**Recursive Definition of toVector()**
![[Pasted image 20231030102827.png]]
![[Pasted image 20231030102833.png]]

**Recursive Definition of getPointerTo()**
![[Pasted image 20231030102854.png]]

**Testing Multiple ADT Implementations**
* Recall test program of Listing 3-2  
* Used ADT bag methods when we tested our implementation  
* Can use the same code—with a few changes  
	– Change each occurrence of _ArrayBag_ to _LinkedBag_ and recompile the program

![[Pasted image 20231030103008.png]]
![[Pasted image 20231030103015.png]]
![[Pasted image 20231030103022.png]]
![[Pasted image 20231030103028.png]]
![[Pasted image 20231030103035.png]]
![[Pasted image 20231030103044.png]]

**Array-Based Implementations**
* Pros  
	– easy to use, but have fixed size  
	– Can access array items directly with equal access time  
* Cons  
	– Array could waste space  
	– Increasing size of dynamically allocated array can waste  storage and time  
* good choice for a small bag

**Link-Based Implementations**
* Pros  
	– do not have fixed size  
	– In a chain of linked nodes, an item points explicitly to the next item  
* Cons  
	– Link-based implementation requires more memory  
	– Must traverse a linked chain to access its ith node  
	– Time to access ith node in a linked chain depends on i

**Next Lecture**
[[Lecture 8 Stacks]]
