/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     November 24,  2023                    */
/*   Due Date:          November 27, 2023                     */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #5                                    */
/*   Filename:          BinarySearchTree.h                    */
/*   Purpose:           Header function to declare the needed */
/*                      functions and helper functions for    */
/*                      the binary tree searching.            */ 
/*                                                            */ 
/**************************************************************/

#ifndef H_BinarySearchTree
#define H_BinarySearchTree

#include <iostream>

using namespace std;

//Definition of the tree node
template <class ItemType>
struct treeNode
{
  ItemType item;
  treeNode<ItemType> *left;
  treeNode<ItemType> *right;
};

template <class ItemType>
class BinarySearchTree
{
public:
  
  //Default constructor, set root to nullptr
  BinarySearchTree();
  
  //constructor that takes a  rootItem 
  BinarySearchTree(const ItemType& rootItem);
  
  //check if the tree is empty
  bool isEmpty() const;
  
  //insert an item into the tree
  void add(const ItemType& newData);
  
  
  /////////////////TO DO///////////////////////////
  //1. get the height of the tree
  int getHeight() const;
  
  //2. tree treversal
  void preorderTraverse() const;
  void inorderTraverse() const;
  void postorderTraverse() const;
  
  //3. returns true if target is in the tree
  bool contains(const ItemType& target) const;
  
  
  //4. copy constructor
  BinarySearchTree(const BinarySearchTree<ItemType>& tree);
  
  //5. remove target from the tree
  //if target is not in the tree, do nothing
  void remove(const ItemType& target);
  
private:
  treeNode<ItemType> * rootPtr; //pointer to the root of the tree
  //define your helper methods here
  bool containtarget(treeNode<ItemType>* subTreePtr, const ItemType& target) const;
  int getH(treeNode<ItemType>* subTreePtr) const;
  void pre(treeNode<ItemType>* subTreePtr) const;
  void inorder(treeNode<ItemType>* subTreePtr) const;
  void post(treeNode<ItemType>* subTreePtr) const;
  void copy(treeNode<ItemType>*& newTreePtr, treeNode<ItemType>* treePtr) const;
  treeNode<ItemType>* removeN(treeNode<ItemType>* nodePtr, const ItemType& target, bool& success);
  treeNode<ItemType>* placeNode(treeNode<ItemType>* subTreePtr,
				treeNode<ItemType>* newNodePtr);
  
};


#include "BinarySearchTree.cpp"

#endif
