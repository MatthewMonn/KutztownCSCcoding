
**Implementations of the ADT Queue**
* Three implementations  
	– Link-based implementation.  
	– Array-based  
	– Can also use implementation of ADT list

![[Pasted image 20231030134153.png]]
![[Pasted image 20231030134202.png]]
![[Pasted image 20231030134211.png]]
![[Pasted image 20231030134217.png]]
![[Pasted image 20231030134223.png]]
![[Pasted image 20231030134231.png]]
![[Pasted image 20231030134240.png]]
![[Pasted image 20231030134251.png]]
![[Pasted image 20231030134301.png]]
![[Pasted image 20231030134308.png]]
![[Pasted image 20231030134318.png]]

**Need to differentiate two situations**
* When queue is empty  
	– front = back + 1  
* When queue is full  
	– front = back + 1  
* Solution: use a counter
![[Pasted image 20231030134402.png]]
![[Pasted image 20231030134413.png]]
![[Pasted image 20231030134452.png]]
![[Pasted image 20231030134540.png]]
![[Pasted image 20231030134546.png]]
![[Pasted image 20231030134551.png]]
![[Pasted image 20231030134559.png]]
![[Pasted image 20231030134605.png]]
![[Pasted image 20231030134612.png]]
![[Pasted image 20231030134620.png]]
![[Pasted image 20231030134626.png]]
![[Pasted image 20231030134634.png]]
**Comparing three implementations**
* Array-based  
	– Has a capacity, no need to deallocate memory  
* Linked-based  
	– No capacity, needs to implement copy constructor, may need to deallocate memory  
* ADT List-based  
	– It is the easiest to code  
	– May not be as efficient as other implementations

**Next Lecture**
[[Lecture 13 Algorithm Efficiency]]

