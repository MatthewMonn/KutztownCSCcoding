LINK-BASED IMPLEMENTATION OF THE ADT *BINARY SEARCH TREE*

**Binary Search Tree**
* Can use most of the codes in Binary Tree  
	– Constructor, destructor, copy constructor, etc.  
* Different implementation for  
	– search  
	– insert  
	– delete

**findNode()**
![[Pasted image 20231114132053.png]]

**Add a new entry**
![[Pasted image 20231114132111.png]]

**Add()**
![[Pasted image 20231114132124.png]]

**placeNode()**
![[Pasted image 20231114132138.png]]

**removeValue**
![[Pasted image 20231114132151.png]]

**Remove N: Three cases**
1.N is a leaf (Elisa)  
2.N has only one child (Qiang)  
3.N has two children (Jose)
![[Pasted image 20231114132222.png]]

**Case 1**
* N is a leaf  
	– Remove leaf containing target  
	– Set pointer in parent to *nullptr*

**Case 2**
* N has only left (or right) child – cases are symmetrical  
	– Replace N with the only child
![[Pasted image 20231114132323.png]]

**Case 3**
* N has two children
![[Pasted image 20231114132349.png]]

**Cannot replace N with a random node**
![[Pasted image 20231114132420.png]]
![[Pasted image 20231114132430.png]]

Two options:  
	1.Replacing N with the smallest element in right subtree  
	2.Replacing N with the largest element in left subtree  
Question:  
- How to find the smallest (or largest) element in a subtree?

![[Pasted image 20231114132450.png]]  
Case 3: two step process  
To delete 83  
	1.Replace 83 with 84 (smallest in right subtree)  
	2.Replace 84 with its only child 91 (case 2)

![[Pasted image 20231114132523.png]]
![[Pasted image 20231114132530.png]]
![[Pasted image 20231114132542.png]]
![[Pasted image 20231114132553.png]]

**Next Lecture** 
[[Lecture 20 Tree Implementations Part 3]]


