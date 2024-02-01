/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     September 12, 2023                    */
/*   Due Date:          September 20, 2023                    */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #1                                    */
/*   Filename:          linkedList.cpp                        */
/*   Purpose:           To add 5 functions that manipulate a  */
/*                      linked list in the existing class.    */               /*                                                            */
/**************************************************************/

template <class Type>
linkedListType<Type>::linkedListType() //default constructor
{
    first = nullptr;
    count = 0;
}


template <class Type>
linkedListType<Type>::~linkedListType() //destructor
{
  nodeType<Type> *temp;   //pointer to deallocate the memory
  //occupied by the node
  while (first != nullptr)   //while there are nodes in
    {                          //the list
      temp = first;        //set temp to the current node
      first = first->link; //advance first to the next node
      delete temp;   //deallocate the memory occupied by temp
    }
  count = 0;
}//end destructor


template <class Type>
bool linkedListType<Type>::isEmptyList() const
{
    return (first == nullptr);
}


template <class Type>
void linkedListType<Type>::print() const
{
    nodeType<Type> *current; //pointer to traverse the list

    current = first;    //set current so that it points to 
                        //the first node
    while (current != nullptr) //while more data to print
    {
      cout << current->info;
      current = current->link;
      if (current != nullptr)
	cout << " -> ";
    }
    cout << endl;
}//end print


template <class Type>
int linkedListType<Type>::length() const
{
    return count;
}  //end length


template <class Type>
void linkedListType<Type>::insertFront(const Type& newItem)
{
    nodeType<Type> *newNode; //pointer to create the new node

    newNode = new nodeType<Type>; //create the new node

    newNode->info = newItem;    //store the new item in the node
    newNode->link = first;      //insert newNode before first
    first = newNode;            //make first point to the
                                //actual first node
    count++;                    //increment count

}//end insertFront


/////////////////////TO DO///////////////////////

template <class Type>
bool linkedListType<Type>::contains(const Type& searchItem) const
{
  nodeType<Type> *current;
  bool found = false;
  current = first;
  while (current != nullptr && !found)
    if (current->info == searchItem)
      found = true;
    else
      current = current ->link;
  return found; 
}


template <class Type>
Type linkedListType<Type>::getElement(int position) const
{
  nodeType<Type> *current;
  current = first;
  int count = 1; 
  while (current != nullptr)
    {
      if (count == position) 
	return current->info;
      count++;
      current = current->link;
    }
  return first->info;
}

template <class Type>
int linkedListType<Type>::getPosition(Type element) const
{
  nodeType<Type> *current;
  current = first;
  int count = 1;
  while (current != nullptr)
    {
      if (current->info == element)
	return count;
      count++;
      current = current->link;
    }
  return -1; 
}

template <class Type>
void linkedListType<Type>::replace(int position, Type element)
{
  nodeType<Type> *current = first;
  int count = 1;
  while (current != nullptr)
    {
      if (count == position)
	{
	  current->info = element;
	  break;
	}
      current = current->link;
      count++;
    }
  
}

template <class Type>
void linkedListType<Type>::remove(int position)
{
  nodeType<Type> *current = first;
  nodeType<Type> *temp;
  int count = 1;
  
  if (position == 1)
    {
      first = first->link;
      delete current;
    }
  
  else
    {
      while (current != nullptr)
	{
	  if (count == position - 1)
	    {
	      temp = current->link;
	      current->link = temp->link;
	      delete temp; 
	    }
	  current = current->link; 
	  count++; 
	}
      delete current; 
    }
}



