**Topics to review** 
* Class
* Template Class
* Initializer 
* Inheritance 
* Function overloading and function overriding 
* Pointers

**A Problem to Solve**
• _Three types of boxes_  
	– Plain box  
	– Toy box  
	– Magic box  
• _Plain box design_  
	– Get and Set public methods

[[Pasted image 20231020104030.png]]


**Initializer**
• Also called “Initialization list”  
• Can only be used in constructor  
• Benefit  
	– Improved performance  
	– The only way  
• for base class initialization  
• to initialize a _const_ data member
![[Pasted image 20231020104405.png]]

**Template Class**
![[Pasted image 20231020104431.png]]

**To use a template class**
* ```
```
PlainBox <double> myNumberBox; 
PlainBox <double> myNumberBox;
```
_Base Classes and Derived Classes_
*  Derived class inherits  
	– All the members of its base class (Except the constructors and destructor)  
	– Cannot access private members of its base class  
	directly

![[Pasted image 20231025140638.png]]

![[Pasted image 20231025140654.png]]
![[Pasted image 20231025140704.png]]

**Overriding Base-Class Methods**

* You can add as many new members to derived  
class as desired  
* You can redefine inherited methods  
	– Called overriding a base-class method.  
* A method overrides a base-class method  
when  
	– The two methods have the same name and  
	parameter declarations

![[Pasted image 20231025140823.png]]
![[Pasted image 20231025140831.png]]
![[Pasted image 20231025140840.png]]
![[Pasted image 20231025140852.png]]

**Deallocating Memory**

* When object in heap is no longer needed, do  
the following _two_ steps  
	– Deallocate it by using delete operator.  
	– Then set pointer variable to nullptr

![[Pasted image 20231025141008.png]]

**Memory Leak**

*  Memory leaks occur when  
	– An object has been created in the free store, but  
	Program no longer has a way to access

![[Pasted image 20231025141046.png]]
![[Pasted image 20231025141055.png]]

**Avoid Dangling Pointers**

*  Situations that can cause dangling pointer  
	– if you do not set a pointer variable to nullptr after  
	using delete  
	– If you declare a pointer variable but do not assign  
	it a value

![[Pasted image 20231025141138.png]]

**Dynamic Allocation of Arrays**
* An ordinary C++ array is statically allocated
![[Pasted image 20231025141217.png]]

* Can use _new_ operator to allocate an array  
dynamically
![[Pasted image 20231025141247.png]]

*  _delete_ returns a dynamically allocated array to  
system for reuse
![[Pasted image 20231025141316.png]]
* Increase size of dynamically allocated array
![[Pasted image 20231025141340.png]]

**Next Lecture**
[[Lecture 2 Polymorphism]]
