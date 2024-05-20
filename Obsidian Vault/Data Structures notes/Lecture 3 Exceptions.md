**When a method fails**
*  Method might return a false to indicate this  
	– But not always possible  
*  Example  
	– Stack method ==peek()== called on empty stack
	![[Pasted image 20231025142731.png]]

![[Pasted image 20231025142739.png]]
![[Pasted image 20231025142748.png]]

**Use Assertions**
* Mainly used to validate pre- or post-conditions
![[Pasted image 20231025142823.png]]
![[Pasted image 20231025142829.png]]
*  False halts program execution  
*  This is a debugging tool  
	– Not a substitute for an _if_ statement
![[Pasted image 20231025142913.png]]

**Throwing Exceptions** 
* Alternate way of communicating or returning  
information to function’s client  
* Thrown exception bypasses normal execution,  
	– Control immediately returns to client.  
* Syntax
	![[Pasted image 20231025142959.png]]

![[Pasted image 20231025143009.png]]
![[Pasted image 20231025143018.png]]

**Handling Exceptions** 
*  ==try== block  
*  ==catch== block
![[Pasted image 20231025143059.png]]

* If statement within _try_ block causes exception  
of type specified in _catch_ block  
1. The rest of _try_ block abandoned  
2. Execution transfers to statements in _catch_ block  
3. After _catch_ block statements finish, execution  
jumps to statement after last catch _block_
![[Pasted image 20231025143207.png]]
![[Pasted image 20231025143217.png]]

**Multiple catch Blocks**
* catch blocks must be ordered  
	– Most specific classes first, more general classes  
	last![[Pasted image 20231025143256.png]]

![[Pasted image 20231025143328.png]]
![[Pasted image 20231025143335.png]]
![[Pasted image 20231025143344.png]]
![[Pasted image 20231025143351.png]]

![[Pasted image 20231025143400.png]]
![[Pasted image 20231025143411.png]]

**Programmer-Defined Exception Classes**
* Usually, C++ exception class _exception_, or one of its derived classes, is the base class  
	– Provides a standardized interface for working with  
	exceptions.  
* Exception class typically consists of a constructor that has a string parameter
![[Pasted image 20231025143556.png]]

**Next Lecture**
[[Lecture 4 Data Abstraction]]


