**Virtual Methods, Abstract Classes**
* Using keyword ==virtual==
	– Expect to be overridden by derived classes  
	– Allows runtime polymorphism, i.e., the code this  
	method executes is determined _at runtime_
* Pure virtual method  
	– Virtual method that has no implementation  
* Abstract class  
	– Has at least one pure virtual method
![[Pasted image 20231025141850.png]]
![[Pasted image 20231025141859.png]]

**Memory allocation in stack**
* locally declared variables or objects
	– activation record (destroyed when function  
	returns)  
	– run-time stack

![[Pasted image 20231025142000.png]]
**Early Binding of Methods**
* Two ways to invoke default constructor
![[Pasted image 20231025142043.png]]
* ==Early binding==
	– Made during compilation  
	– Cannot be altered during execution
	![[Pasted image 20231025142121.png]]

**Problem to Solve**
* Used in this context
![[Pasted image 20231025142234.png]]
* Code compiles, but does not perform as you  
would expect due to

* Version of ==setItem== called is determined when  
the program is compiled
	![[Pasted image 20231025142322.png]]
* Need a way to communicate to compiler
	– Code to execute should not be determined until  
	program is running.  
	– Called ==late binding==

* Allow compiler to perform the late binding  
necessary for polymorphism  
	– Declare methods in base class as _virtual._

![[Pasted image 20231025142454.png]]
![[Pasted image 20231025142504.png]]
![[Pasted image 20231025142530.png]]

**Next Lecture**
[[Lecture 3 Exceptions]]


