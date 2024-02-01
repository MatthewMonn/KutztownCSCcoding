/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     November 24,  2023                    */
/*   Due Date:          November 27, 2023                     */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #5                                    */
/*   Filename:          BinarySearchTree.cpp                  */
/*   Purpose:           contains the additional needed        */
/*                      functions that preoder, postorder,    */
/*                      inorder, getheight, contains, remove  */ 
/*                      and deep copy the binary tree,        */
/*                      implementations.                      */ 
/**************************************************************/

template <class ItemType>
BinarySearchTree<ItemType>::BinarySearchTree()
{
  rootPtr = nullptr;
}

template <class ItemType>
BinarySearchTree<ItemType>::
BinarySearchTree(const ItemType& rootItem)
{
  //create a tree with a single tree node
  rootPtr = new treeNode<ItemType>;
  rootPtr -> item = rootItem;
  rootPtr -> left = nullptr;
  rootPtr -> right = nullptr;
}


template<class ItemType>
bool BinarySearchTree<ItemType>::isEmpty() const
{
  return rootPtr == nullptr;
}  

template<class ItemType>
void BinarySearchTree<ItemType>::
add(const ItemType& newData)
{
  //create a new tree node containing newData
  treeNode<ItemType>* newNodePtr = new treeNode<ItemType>; 
  newNodePtr -> item = newData;
  newNodePtr -> left = nullptr;
  newNodePtr -> right = nullptr;
  
  //place the tree node in the tree
  rootPtr = placeNode(rootPtr, newNodePtr);
}

template<class ItemType>
treeNode<ItemType>* BinarySearchTree<ItemType>::
placeNode(treeNode<ItemType>* subTreePtr,
	  treeNode<ItemType>* newNodePtr)
{
  if (subTreePtr == nullptr)
    return newNodePtr;
  else
    {
      if (subTreePtr -> item > newNodePtr -> item)
	{
	  treeNode<ItemType>* tempPtr = placeNode(subTreePtr -> left, newNodePtr);
	  subTreePtr -> left = tempPtr;
	}
      else
	{
	  treeNode<ItemType>* tempPtr = placeNode(subTreePtr -> right, newNodePtr);
          subTreePtr -> right = tempPtr;
	}
      return subTreePtr;
    }
}

//////////////////TO DO///////////////////////////////
template<class ItemType>
int BinarySearchTree<ItemType>::getHeight() const
{
  return getH(rootPtr); //helper function for getheight. 
}

template<class ItemType>
void BinarySearchTree<ItemType>::preorderTraverse() const
{
  pre(rootPtr); //helper function for preoderTraversal. 
  cout << endl;
}

template<class ItemType>
void BinarySearchTree<ItemType>::inorderTraverse() const
{
  inorder(rootPtr); //helper function for inorderTraversal.
  cout << endl;
}

template<class ItemType>
void BinarySearchTree<ItemType>::postorderTraverse() const
{
  post(rootPtr); //helper function for postorderTraversal. 
  cout << endl;
}


template<class ItemType>
bool BinarySearchTree<ItemType>::contains(const ItemType& target) const
{
  return containtarget(rootPtr, target); //helper function to return true or false if it contains target. 
}


template<class ItemType>
BinarySearchTree<ItemType>::BinarySearchTree(const BinarySearchTree<ItemType>& tree)
{
  copy(rootPtr, tree.rootPtr); //helper function to deep copy the tree. 
}


template<class ItemType>
void BinarySearchTree<ItemType>::remove(const ItemType& target)
{
  bool On = false;
  rootPtr = removeN(rootPtr, target, On); //helper function to remove target node and return tree after removal.
}

template<class ItemType>
bool BinarySearchTree<ItemType>::containtarget(treeNode<ItemType>* subTreePtr, const ItemType& target) const {
  if (subTreePtr == nullptr)
    return false; //checking for empty tree.
  else if (subTreePtr->item == target)
    return true; //checking if next node is the target.
  else if (target < subTreePtr->item) //checking other subtree node. 
    return containtarget(subTreePtr->left, target); // Searching in left subtree
  else
    return containtarget(subTreePtr->right, target); // Searching in right subtree
}

template<class ItemType>
int BinarySearchTree<ItemType>::getH(treeNode<ItemType>* subTreePtr) const {
  if (subTreePtr == nullptr)
    return 0; //returns 0 as base case. 
  
  int left = getH(subTreePtr->left); //checking left node. 
  int right = getH(subTreePtr->right); //checking right node.
  
  // Return the maximum height of left or right subtree plus 1 (for the current node)
  return 1 + max(left, right);
}
template<class ItemType>
void BinarySearchTree<ItemType>::pre(treeNode<ItemType>* subTreePtr) const {
  if (subTreePtr != nullptr) { //checking if node isnt empty. 
    cout << subTreePtr->item << " "; // print the current node
    pre(subTreePtr->left); // search left subtree
    pre(subTreePtr->right); // search right subtree
  }
}
template<class ItemType>
void BinarySearchTree<ItemType>::inorder(treeNode<ItemType>* subTreePtr) const {
  if (subTreePtr != nullptr) { //checking if node isnt empty.
    inorder(subTreePtr->left); // search left subtree
    cout << subTreePtr->item << " "; //print the current node
    inorder(subTreePtr->right); // search right subtree
  }
}
template<class ItemType>
void BinarySearchTree<ItemType>::post(treeNode<ItemType>* subTreePtr) const {
  if (subTreePtr != nullptr) { //checking if node isnt empty.
    post(subTreePtr->left); // search left subtree
    post(subTreePtr->right); // search right subtree
    cout << subTreePtr->item << " "; //print the current node
  }
}
template<class ItemType>
treeNode<ItemType>* BinarySearchTree<ItemType>::removeN(treeNode<ItemType>* nodePtr, const ItemType& target, bool& success) {
  if (nodePtr == nullptr) {
    success = false; //checking if first node is empty. 
    return nullptr;
  }
  
  if (target < nodePtr->item) {
    nodePtr->left = removeN(nodePtr->left, target, success); //searching left side. 
  } else if (target > nodePtr->item) {
    nodePtr->right = removeN(nodePtr->right, target, success); //searching right side. 
  } else {
    success = true; // Node to be deleted found
    
    // If Node has 0 or 1 child: 
    if (nodePtr->left == nullptr) {
      treeNode<ItemType>* tempPtr = nodePtr->right; //moves to next node to right side.
      delete nodePtr;
      return tempPtr;
    } else if (nodePtr->right == nullptr) {
      treeNode<ItemType>* tempPtr = nodePtr->left; //moves to next node to left side.
      delete nodePtr;
      return tempPtr;
    }
    
    // If Node has 2 children:
    // Finding the smallest node in the right subtree.
    treeNode<ItemType>* tempPtr = nodePtr->right;
    while (tempPtr->left != nullptr) {
      tempPtr = tempPtr->left;
    }
    nodePtr->item = tempPtr->item; //copys the correct inorder node.
    // Delete the inorder node.
    nodePtr->right = removeN(nodePtr->right, tempPtr->item, success);
  }
  
  return nodePtr;
}
template<class ItemType>
void BinarySearchTree<ItemType>::copy(treeNode<ItemType>*& newTreePtr, treeNode<ItemType>* treePtr) const {
  if (treePtr != nullptr) {
    // Copy current node
    newTreePtr = new treeNode<ItemType>;
    newTreePtr->item = treePtr->item;
    newTreePtr->left = nullptr;
    newTreePtr->right = nullptr;
    
    // Recursively copy left and right subtrees
    copy(newTreePtr->left, treePtr->left);
    copy(newTreePtr->right, treePtr->right);
  } else {
    newTreePtr = nullptr;
  }
}