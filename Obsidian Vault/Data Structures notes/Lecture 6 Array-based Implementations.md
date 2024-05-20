**Review** 
*  An ADT is  
	– A collection of data ... and ...  
	– A set of operations on that data  
* Specifications indicate  
	– What ADT operations do  
	– But not how to implement  
*  First step for implementation  
	– Choose data structure

![[Pasted image 20231030101301.png]]

**To implement an ADT**

* Don’t define entire class and attempt test  
*  Identify and test a group of _core methods_  
	– Central to the purpose of the ADT  
	– Allow reasonable testing

**Recall: The Bag ADT**
![[Pasted image 20231030101402.png]]
![[Pasted image 20231030101414.png]]

**Interface**
* a.k.a abstract class  
* Purpose  
	– Defining a contract for ADT  
	– Provide a common interface  
	– Enforcing implementation  
	– Allow polymorphism and run-time binding

**Array-Based Implementation**
* Use fixed-size array  
* Things to consider  
	– How to keep track of array elements used, available?  
	– Where does first object go? 0 or 1 or ...?  
	– How do add/delete methods function?  
	– What happens when array is full?
![[Pasted image 20231030101711.png]]
![[Pasted image 20231030101828.png]]
![[Pasted image 20231030101840.png]]
![[Pasted image 20231030101851.png]]

**C++ Vectors**
* `#include <vector> `
* Used to store elements of same type  
* Size can grow dynamically
![[Pasted image 20231030102030.png]]
![[Pasted image 20231030102037.png]]
![[Pasted image 20231030102045.png]]
![[Pasted image 20231030102054.png]]
![[Pasted image 20231030102104.png]]
![[Pasted image 20231030102111.png]]
![[Pasted image 20231030102117.png]]
![[Pasted image 20231030102126.png]]
![[Pasted image 20231030102134.png]]
![[Pasted image 20231030102145.png]]
![[Pasted image 20231030102152.png]]
![[Pasted image 20231030102203.png]]
![[Pasted image 20231030102209.png]]
![[Pasted image 20231030102216.png]]
![[Pasted image 20231030102223.png]]
![[Pasted image 20231030102232.png]]
![[Pasted image 20231030102239.png]]

**Next Lecture**
[[Lecture 7 Link-Based Implementations]]
