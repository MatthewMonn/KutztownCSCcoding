**STL Containers**
* C++ has a library of container classes  
	– In form of class templates  
	– Defined as Standard Template Library (STL)  
* So why does this text develop ADTs?  
	– Learn how to develop ADTs not found in STL  
	– STL not part of class hierarchy  
	– Working in a language without STL
* Types of containers using STL  
	– Sequence containers  
	– Associative containers  
	– Container adapters  
* Operations common to all STL containers  
	– Constructor, destructor  
	– *operator* =  
	– *bool* empty()  
	– *unit* size()

**Sequence Container**
* Organizes and stores elements in a linear sequence  
* Elements can be accessed sequentially  
	– array  
	– vector  
	– deque  
	– list  
	– forward_list

**Common methods supported by Sequence Containers**
![[Pasted image 20231205221209.png]]
![[Pasted image 20231205221221.png]]

**array**
* A fixed-size array
![[Pasted image 20231205221244.png]]
* Can use at() method to access array elements  
	– throw exception if out of bound

**vector**
* Implemented by dynamic arrays  
* Can increase in size as necessary  
* Time complexity  
	– Push_back(), pop_back()  
* O(1)  
	– Push_front(), pop_front(), insert(), erase()  
* O(n)

**Create a 2-D array using vector**
![[Pasted image 20231205221333.png]]

**Iterator**
* A safe pointer  
* Use iterators to traverse the vector
![[Pasted image 20231205221402.png]]
* Why use iterators  
	– Abstraction  
	– Consistency  
* Same code works with all container class  
	– Safety  
* No out_of_bound error  
	– Performance  
	– Compatibility with algorithms
* Range-based for loop  
	– Introduced in C++11  
	– Simplified syntax and less error-prone  
	– Based on iterators  
* Insert an element

**deque**
* Double-ended queue  
* Does not use continuous memory locations  
* Time complexity  
	– push_back(), pop_back(), push_front(), pop_front()  
* O(1)  
	– insert(), erase()  
* O(n)

**list**
* Doubly-linked list  
* Does not support [ ] operator  
* Time complexity  
	– push_back(), pop_back(), push_front(), pop_front(), insert(), erase()  
* O(1)  
* Fast insertion/deletion  
* Increased memory overhead  
* Operations slower than vector in general
![[Pasted image 20231205221554.png]]

**forward_list**
* Singly-linked list  
* Time complexity  
	– push_front(), pop_front(), insert(), erase()  
* O(1)  
* Needs less memory than list  
* Does not support backward traverse
![[Pasted image 20231205221627.png]]

**Container Adapter**
* It is an interface, implemented by limiting functionality in a pre-existing container  
	– stack  
	– queue  
	– priority_queue

**stack**
* STL stack operations  
	– value_type& top()  
	– void push(value_type& item)  
	– void pop()  
* Can implemented by vector, deque (by fault), or list
![[Pasted image 20231205221721.png]]
![[Pasted image 20231205221729.png]]

**queue**
* STL *queue* operations  
	– value_type& front()  
	– value_type& back()  
	– *void* push(value_type& item)  
	– *void* pop()  
* Can be implemented by deque (by fault), or list

**priority_queue**
* STL priority_queue operations  
	– value_type& top()  
	– void push(value_type& item)  
	– void pop()  
* Can be implemented by array or vector  
* Max-heap by default  
![[Pasted image 20231205221908.png]]
* To create a min-heap, provide a custom comparison function  
![[Pasted image 20231205221926.png]]

**Associative Containers**
* Based on Binary Search Tree  
	– set, map  
* Based on Hash Table  
	– unordered_set, unordered_map  
* Allow non-unique key  
	– multiset, multimap  
	– unordered_multiset, unordered_multimap
	https://hackingcpp.com/cpp/std/associative_containers.html
![[Pasted image 20231205222010.png]]

**Associative Containers**
![[Pasted image 20231205222025.png]]
![[Pasted image 20231205222031.png]]

**STL Algorithms**
* STL Search and compare Algorithms  
	– *void* for_each(iterator start, iterator end, Function fun)  
	– iterator find(iterator start, iterator end, value_type& val)  
	– iterator find_if(iterator start, iterator end, PredFunction fun)  
	– *uint* count(iterator start, iterator end, value_type& val)
* STL Search and compare Algorithms (ctd)  
	– *uint* count_if(iterator start, iterator end, PredFunction fun)  
	– *bool* equal(iterator start1, iterator end1, iterator start2)  
	– value_type& min(value_type& item1, value_type& item2)
* STL Search and compare Algorithms (ctd)  
	– value_type& min_element(iterator start, iterator end)  
	– value_type& max(value_type& item1, value_type& item2)  
	– value_type& max_element(iterator start, iterator end)
* STL sequence modification algorithms  
	– iterator copy(iterator start1, iterator end1, iterator start2)  
	– iterator copy_backward(iterator start1, iterator end1, iterator start2)  
	– *void* swap(value_type& item1, value_type& item2)
* STL sequence modification algorithms (ctd.)  
	– iterator transform(iterator start1, iterator end1, iterator start2, UnaryOperator op)  
	– iterator transform(iterator start1, iterator end1, iterator operand2, iterator start2, BinaryOperator bop)  
	– void fill(iterator start1, iterator end1, value_type& val)
* STL sorting and heap algorithms  
	– *void* sort(iterator start, iterator end)  
	– *void* stable_sort(iterator start, iterator end)  
	– iterator partition(iterator start, iterator end, PredFunction fun)  
	– iterator partition_stable(iterator start, iterator end, PredFunction fun)  
	– *void* nth_element(iterator start, iterator nth, iterator end)
* STL sorting and heap algorithms (ctd.)  
	– *void* make_heap(iterator start, iterator end)  
	– *void* push_heap(iterator start, iterator end)  
	– *void* pop_heap(iterator start, iterator end)  
	– *void* sort_heap(iterator start, iterator end)





