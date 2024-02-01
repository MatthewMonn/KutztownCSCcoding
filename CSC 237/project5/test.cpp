#include <iostream>
#include <iomanip>
#include "BinarySearchTree.h"

using namespace std;

int main()
{
  cout << left;
  
  //create a empty BST
  BinarySearchTree<int> tree1;

  //add eight nodes
  tree1.add(6);
  tree1.add(4);
  tree1.add(11);
  tree1.add(3);
  tree1.add(5);
  tree1.add(7);
  tree1.add(10);
  tree1.add(13);
  

  //testing getHeight()
  cout << endl;
  cout << "==Testing getHeight()==\n";
  cout << setw(12) << "Height:" << tree1.getHeight() << endl;
  cout << "==Adding another tree node==\n";
  tree1.add(8);
  cout << setw(12) << "Height:" << tree1.getHeight() << endl;


  //testing tree traversal
  cout << endl;
  cout << "==Testing Tree Treversal==\n";

  cout << setw(12) << "Preorder:";
  tree1.preorderTraverse();

  cout << setw(12) << "Inorder: ";
  tree1.inorderTraverse();

  cout << setw(12) << "Postorder: ";
  tree1.postorderTraverse();


  //testing contains()
  cout << endl;
  cout << "==Testing contains()==\n";

  cout << setw(12) << "Contains 5:" <<  boolalpha << tree1.contains(5) << endl;
  cout << setw(12) << "Contains 8: " <<  boolalpha << tree1.contains(8) << endl;
  cout << setw(12) << "Contains 2: " <<  boolalpha << tree1.contains(2) << endl;


  //testing copy constructor
  cout << endl;
  cout << "==Testing copy constructor==\n";

  //copy tree1 into tree2
  BinarySearchTree<int> tree2(tree1); 

  //add two more nodes to tree1
  tree1.add(2);
  tree1.add(1);

  //print out preorder traveral
  cout << "Tree 1 Preorder Traversal:\n";
  tree1.preorderTraverse();
  cout << "Tree 2 Preorder Traversal:\n";
  tree2.preorderTraverse();

  //testing remove()
  cout << endl;
  cout << "==Testing remove()==\n";
  cout << "Case 1: remove a leaf node (13): \n";
  tree1.remove(13);
  cout << setw(12) << "Preorder:";
  tree1.preorderTraverse();
  cout << endl;

  cout << "Case 2: remove a node with one child (3): \n";
  tree1.remove(3);
  cout << setw(12) << "Preorder:";
  tree1.preorderTraverse();
  cout << endl;

  cout << "Case 3: remove a node with two children (6): \n";
  tree1.remove(6);
  cout << setw(12) << "Preorder:";
  tree1.preorderTraverse();
  cout << endl;

}
