**Nodes in a Binary Tree**
* Array-based  
	– Pointers will be array indices  
* Link-based  
	– Use C++ pointers

ARRAY-BASED IMPLEMENTATION OF THE ADT **BINARY TREE**

**Array-Based Representation**
* Class of array-based data members
![[Pasted image 20231110103452.png]]
	– Variable root is index to tree’s root node within the array tree  
	– If tree is empty, root = -1
	
![[Pasted image 20231110103512.png]]
![[Pasted image 20231205213437.png]]

**When the tree is complete**
* Array implementation can be further optimized  
	– No need to store indices for left/right child  
	– Can compute the index of left child and right child
![[Pasted image 20231205213514.png]]

**LINK-BASED IMPLEMENTATION OF THE ADT BINARY TREE**

**Binary Tree Node Class**
![[Pasted image 20231205213540.png]]![[Pasted image 20231205213540 1.png]]

**Each tree node has two pointers**
![[Pasted image 20231205213604.png]]

**Binary Tree Class**
![[Pasted image 20231205213617.png]]
![[Pasted image 20231205213625.png]]
![[Pasted image 20231205213631.png]]

**Three constructors**
![[Pasted image 20231205213645.png]]

**copyTree()**
![[Pasted image 20231205213658.png]]

**Copy constructor**
![[Pasted image 20231205213713.png]]

**destroyTree() used by the destructor**
![[Pasted image 20231205213733.png]]
*Destroy tree nodes in a postorder traversal*

**getHeightHelper()**
![[Pasted image 20231205213759.png]]

**Add a new node**
![[Pasted image 20231205213811.png]]
![[Pasted image 20231205213818.png]]
*If the height of one subtree is larger, then add the new node to the  
other subtree.  
Add to left subtree by default.*

![[Pasted image 20231205213851.png]]

**Inorder tree traversal**
![[Pasted image 20231205213908.png]]
* Takes a client method visit() as its first parameter

**Next Lecture**
[[Lecture 19 Tree Implementations Part 2]]
