**Raw Pointers*** 
* Using ==new== to allocate  
* Pointer variable  
* Use ==delete== to deallocate  
	– Dangling pointers  
	– Memory leaks

**In Java or Python**
* Direct reference to objects _not allowed_  
* Use a reference count object to track number  of aliases that reference an object  
* When object no longer has references  
	– Call deallocate (_garbage collection_)

**Smart Pointers**
* C++ now supports “smart” pointers  
	– provide automatic memory management features
	![[Pasted image 20231030133419.png]]

**Three kinds of Smart Pointers**
* `#include <memory>`
* shared_ptr – provides _shared ownership_ of object  
* unique_ptr – provides _unique ownership_ of object  
* weak_ptr – no ownership, read only

* A shared pointer ...  
	– Provides a ==safe mechanism== to implement shared object ownership  
	– Maintains a count of aliases to an object  
	– Calls destructor of managed object when reference count reaches 0

**Raw pointer vs smart pointer**
![[Pasted image 20231030133641.png]]

**Ways of creating the smart pointer**
![[Pasted image 20231030133657.png]]

**Revised Node Class**
* Use shared pointers
![[Pasted image 20231030133718.png]]
![[Pasted image 20231030133725.png]]
![[Pasted image 20231030133735.png]]
![[Pasted image 20231030133742.png]]
![[Pasted image 20231030133751.png]]
![[Pasted image 20231030133800.png]]
![[Pasted image 20231030133806.png]]
![[Pasted image 20231030133812.png]]
![[Pasted image 20231030133818.png]]

**Unique Pointers**
* A unique pointer ...  
	– Has solitary ownership of its managed object  
	– Behaves as if it maintains a reference count of either 0 or 1 for its managed object  
	– Can transfer its unique ownership of its managed object to another unique pointer using method ==move==  
	– Cannot be assigned to another unique pointer

**Ways of creating a unique Pointer**
![[Pasted image 20231030133944.png]]
![[Pasted image 20231030133952.png]]

**Using Weak Pointers**
* Weak pointer only ==observes== managed object  
	– But does not have ownership  
	– Therefore, cannot affect its lifetime  
* After these statements execute, reference count for object managed by _sharedPtr1_ is 3
![[Pasted image 20231030134038.png]]
![[Pasted image 20231030134046.png]]
![[Pasted image 20231030134056.png]]

**Next Lecture**
[[Lecture 12 Implementation of the ADT Queue]]
