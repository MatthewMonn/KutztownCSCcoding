**Faster Sorting Algorithms**
* The Merge Sort  
* The Quick Sort  
* The Radix Sort  
* Merge sort and Quick sort are called *divide-and-conquer* algorithms

**Divide and Conquer**
* Leads to a recursive solution
![[Pasted image 20231103100825.png]]

**Merge Sort**
![[Pasted image 20231103100856.png]]
![[Pasted image 20231103100907.png]]
![[Pasted image 20231103100916.png]]
![[Pasted image 20231103100925.png]]
![[Pasted image 20231103100934.png]]
![[Pasted image 20231103100945.png]]

**The Merge Sort Analysis**
![[Pasted image 20231103101000.png]]
* Worst case O(n log n)  
* Average case: O(n log n)  
* It is *not in-place*  
	– requires O(n) extra space  
* It is *stable*
![[Pasted image 20231103101044.png]]

**External Merge Sort**
* Merge sort is suitable for external sorting  
* To sort 200MB of data (A1, A2 each is 100MB) with only 100MB RAM  
	– Load A1 into RAM, sort, write to disk  
	– Load A2 into RAM, sort, write to disk  
	– Load the first 50MB of A1 and the first 50MB of A2, apply merge sort,  write to disk  
	– Load the second 50MB of A1 and the second 50MB of A2, apply merge sort, write to disk

**The Quick Sort**
* Divide and conquer  
* Divide (or Partition)  
* Pick a random element called pivot  
* Divide array into two parts  
	– Less than or equal to the pivot  
	– Greater than or equal to the pivot
![[Pasted image 20231103101236.png]]

**Two recursive function calls**
![[Pasted image 20231103101253.png]]

**How to do in-place partition**
![[Pasted image 20231103101311.png]]

**Median-of-three Pivot Selection**
![[Pasted image 20231103101329.png]]
![[Pasted image 20231103101342.png]]

**Use insertion sort as a subroutine**
![[Pasted image 20231103101408.png]]
![[Pasted image 20231103101429.png]]

**The Quick Sort Analysis**
![[Pasted image 20231103101444.png]]
* Analysis  
	– Partitioning is an O(n) task  
	– Worst case O(n2)  
	– Average case O(n log n)  
	– Quick Sort is *in-place*  
	– no extra space is needed  
	– Quick Sort is *not stable*  
	– Nonadjacent swaps used in partition

**The Radix Sort**
* Not a general purpose sorting algorithm  
* Assumption: Each element has up to d (say 5) digits/letters  
	– d does not depend on n  
* Sort by organizing data according to least significant digits/letters  
	– aka Bucket Sort (*must be stable!*)
![[Pasted image 20231103101556.png]]
![[Pasted image 20231103101603.png]]
• Analysis  
	– Requires n moves each time it forms groups  
	– n moves to combine again into one group  
	– Performs these 2 X n moves d times  
	– Thus requires 2 X n X d moves  
* Radix sort is of order O(n)  
	– Assuming d is a constant  
* More appropriate for chain of linked lists than for an array

**A Comparison of Sorting Algorithms**
![[Pasted image 20231103101706.png]]

**Next Lecture**
[[Lecture 16 Trees Part 1]]
