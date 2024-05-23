**What Is a Good Solution?**
* Important elements of the solution  
	– Good structure  
	– Good documentation  
	– *Efficiency*

**Measuring Efficiency of Algorithms**
* Important because  
	– Choice of algorithm has significant impact

![[Pasted image 20231101140315.png]]
* Analysis of algorithms  
	– Comparison of algorithms should focus on *significant* differences in efficiency  
	– We consider comparisons of *algorithms (“ideas”)*, not programs

* Difficulties with comparing programs  
	– How are the algorithms coded  
	– What computer will be used  
	– What data should the program use  
* Algorithm analysis should be independent of  
	– Specific implementations, computers, and data

**The Execution Time of Algorithms**
* An algorithm’s execution time is related to number of operations it requires.  
* Example: Tower of Hanoi  
	– Solution for n disks required 2n – 1 moves  
	– If each move requires time m  
	– Solution requires (2n – 1)  m time units

**Order of Growth**
* Measure an algorithm’s time requirement as *a function of the problem size*  
	– How quickly algorithm’s time requirement grows as a function of problem size  
	![[Pasted image 20231101140634.png]]
	– Which one is better?
![[Pasted image 20231101140653.png]]

**Problem Size**
* Or input size  
	– Number of bits needed to represent/specify input  
* The Sorting Problem  
	– Given a sequence of n numbers, sort them.  
* The Integer Factorization Problem  
	– Given an integer n, find a non-trivial factor of n.  
	– https://en.wikipedia.org/wiki/RSA_numbers#RSA-330

**Analysis and Big O Notation**
![[Pasted image 20231101140848.png]]
![[Pasted image 20231101140857.png]]

**Basics rules to determine big-Oh**
* Only keep the term with the highest growth  
* Ignore the multiplicative constant  
* Ignore the base of the logarithm function
![[Pasted image 20231101140949.png]]
![[Pasted image 20231101141000.png]]
![[Pasted image 20231101141012.png]]

**Analysis of a program**
* Traversal of a linked list  
* How many operations are done?
![[Pasted image 20231101141045.png]]
![[Pasted image 20231101141053.png]]

**Problem Solving**
* Given a sorted array of n integers and a target value x, find two array elements that sum up to x. (can use same element twice)
![[Pasted image 20231101141138.png]]

**Analysis and Big O Notation**
* Worst-case analysis  
	– Worst case analysis usually considered  
	– Easier to calculate, thus more common  
* Average-case analysis  
	– More difficult to perform  
	– Must determine relative probabilities of encountering problems of given size

**Keeping Your Perspective**
* ADT used makes a difference  
	– Array-based getEntry is O(1)  
	– Link-based getEntry is O(n)  
* Choosing implementation of ADT  
	– Consider how frequently certain operations will occur  
	– Seldom used but critical operations must also be efficient
* If problem size is always small  
	– Possible to ignore algorithm’s efficiency  
* Weigh trade-offs between  
	– Algorithm’s time and memory requirements  
* Compare algorithms for style and efficiency

**Efficiency of Searching Algorithms**
* Sequential search  
	– Worst case: O(n)  
	– Average case: O(n)  
	– Best case: O(1)  
* Binary search  
	– O(log2n) in worst case  
	– At same time, maintaining array in sorted order requires overhead cost ... can be substantial

**Next Lecture**
[[Lecture 14 Sorting Algorithms Part 1]]


