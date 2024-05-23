**Basic Sorting Algorithms**
* Sorting:  
	– Organize a collection of data into either ascending or descending order  
* Internal sort  
	– Collection of data fits in memory  
* External sort  
	– Collection of data does not all fit in memory  
	– Must reside on secondary storage
* The Selection Sort  
* The Bubble Sort  
* The Insertion Sort
https://visualgo.net/bn/sorting

**The Selection Sort**
![[Pasted image 20231101141637.png]]
![[Pasted image 20231101141646.png]]

**The Selection Sort**
* Analysis  
	– Selection sort is O(n2)  
	– Appropriate only for small n  
* Only uses n-1 swaps in worst case  
* Could be a good choice when data moves are costly but comparisons are not  
	– For example: when each data item is large but sort key is short

**The Bubble Sort**
* Compares adjacent items  
	– Exchanges them if out of order  
	– Requires several passes over the data  
* When ordering successive pairs  
	– Largest item bubbles to end of the array
![[Pasted image 20231101141830.png]]
![[Pasted image 20231101141842.png]]
* Analysis  
	– Worst case O(n2)  
	– Best case (array already in order) is O(n)  
* Good for  
	– Educational purposes  
	– Small sequence  
	– Nearly sorted data  
	– Special situation where an adjacent swaps is preferred (data stored on tape or in linked list)

**The Insertion Sort**
* Take each item from unsorted region  
	– Insert it into correct order in sorted region
![[Pasted image 20231101141959.png]]
![[Pasted image 20231101142008.png]]
![[Pasted image 20231101142015.png]]
* Analysis  
	– Worst case O(n2)  
	– Best case (array already in order) is O(n)  
* Good for  
	– small (n < 25) arrays  
	– Nearly sorted arrays  
* Unsuitable for large arrays

**In-place sort**
* A sorting algorithm is called *in-place* if  
	– it uses only O(1) extra space  
	– it updates the input sequence directly by operations like swapping  
* All the three sorting algorithms discussed (selection sort, bubble sort, insertion sort) are in-place

**Stable sort**
* A stable sorting algorithm maintains the relative positions of identical elements.
![[Pasted image 20231101142202.png]]
* If an algorithm uses non-adjacent swap, then it is not stable.  
* Selection sort is not stable.  
* Bubble sort and insertion sort are stable.

**Next Lecture**
[[Lecture 15 Sorting Algorithms Part 2]]
