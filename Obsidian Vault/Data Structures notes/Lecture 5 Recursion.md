**Recursion Solutions**
* Recursion breaks problem into ==smaller, identical ==problems
	![[Pasted image 20231025133138.png]]

* A recursive function _calls itself_  
* Each recursive call solves an _identical, but smaller_, problem
* Test for _base case_ enables recursive calls to stop

**Example: Compute n!**
* An iterative solution
	![[Pasted image 20231025133334.png]]
* A recursive solution 
	![[Pasted image 20231025133403.png]]
	![[Pasted image 20231025133424.png]]
![[Pasted image 20231025133438.png]]
![[Pasted image 20231025133446.png]]
![[Pasted image 20231025133553.png]]

**The Box Trace**
![[Pasted image 20231025133618.png]]
![[Pasted image 20231025133626.png]]

**Constructing Recursive Solutions**
Questions to ask:  
1. How to define the problem in terms of a smaller identical problem?  
2. How does each recursive call diminish the size of the problem?  
3. What is the base case?  
4. Will you eventually reach base case?

**Tower of Hanoi**
![[Pasted image 20231025133952.png]]
![[Pasted image 20231025133958.png]]

**Solving Tower of Hanoi**

* Notation: ==towers(n, pole1, pole2, pole3)==  
	– n disks on pole1, move to pole2, use pole3 as temp  
*  To solve towers(n, A, B, C)  
	1.call _towers(n – 1, A, C, B)_  
	2.Move largest disk: call _towers(1, A, B, C)_  
	3.call _towers(n – 1, C, B, A)_

![[Pasted image 20231025134154.png]]

**Writing a String Backward** 
*  Likely candidate for minor task is writing a single character.  
	– Possible solution: strip away the last character
	![[Pasted image 20231025134247.png]]

**Writing an Array’s Entries in Backward Order**
![[Pasted image 20231025134314.png]]

**The Binary Search**
Consider details before implementing algorithm:  
	1. How to pass half of _anArray_ to recursive calls of _binarySearch_?  
	2. How to determine which half of array contains _target_?  
	3. What should base case(s) be?  
	4. How will _binarySearch_ indicate result of search?
![[Pasted image 20231025134512.png]]

**Successful Search**
	![[Pasted image 20231025134546.png]]

**Unsuccessful Search**
	![[Pasted image 20231025134608.png]]

![[Pasted image 20231025134626.png]]
![[Pasted image 20231025134635.png]]
![[Pasted image 20231025134643.png]]
![[Pasted image 20231025134651.png]]

**Recursion and Efficiency**
*  Factors that contribute to inefficiency  
	– Overhead associated with function calls  
	– Some recursive algorithms inherently inefficient  
*  Keep in mind  
	– Recursion can clarify complex solutions ... but ...  
	– Clear, efficient iterative solution may be better

**Next Lecture** 
[[Lecture 6 Array-based Implementations]]
