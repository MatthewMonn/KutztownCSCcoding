**Trees**
* Lists, stacks, and queues are *linear*  
	– Items are one after another.  
* Trees are *nonlinear, hierarchical*  
	– Item can have more than one immediate successor
![[Pasted image 20231110101050.png]]

**Unrooted tree vs rooted tree**
![[Pasted image 20231110101108.png]]

**Terminology**
* Parent, child, sibling, ancestor, descendant  
* Root, leaf, internal node  
* Subtree
![[Pasted image 20231110101141.png]]

**General Tree and Binary Tree**
* General tree  
	– No limit on the number of children
	![[Pasted image 20231110101211.png]]

* Binary tree  
	– at most two children  
	– left child and right child
	![[Pasted image 20231110101236.png]]

**Expression tree**
![[Pasted image 20231110101253.png]]

**The Height of a Tree**
* Height of a tree  
	– Number of nodes on longest path from root to a leaf
![[Pasted image 20231110101326.png]]
![[Pasted image 20231110101335.png]]

**A Full Binary Trees**
A full binary tree has all possible nodes at all levels
![[Pasted image 20231110101359.png]]

**A Complete Binary Tree**
A complete binary tree is full up to height h-1, with height h filled in from left to right.
![[Pasted image 20231110101425.png]]

**Maximum Height**
• The maximum possible height of a binary tree with n nodes is n.
![[Pasted image 20231110101510.png]]

**Minimum Height**
![[Pasted image 20231110101524.png]]
![[Pasted image 20231110101530.png]]

**The ADT Binary Tree**
* Operations of ADT binary tree  
	– Add, remove  
	– Set, retrieve data  
	– Test for empty  
	– Traversal operations that visit every node

**Traversals of a Binary Tree**
* Options for when to visit the root  
	– *Preorder*: before it traverses both subtrees  
	– *Inorder*: after it traverses left subtree, before it traverses right subtree  
	– *Postorder*: after it traverses both subtrees  
* Time complexity: O(n)
![[Pasted image 20231110101809.png]]

**Preorder Traversal**
![[Pasted image 20231110101834.png]]
![[Pasted image 20231110101840.png]]

**Inorder Traversal**
![[Pasted image 20231110101956.png]]
![[Pasted image 20231110102003.png]]

**Postorder Traversal**
![[Pasted image 20231110102021.png]]
![[Pasted image 20231110102028.png]]

![[Pasted image 20231110102136.png]]
![[Pasted image 20231110102150.png]]

**Next Lecture**
[[Lecture 17 Trees Part 2]]
