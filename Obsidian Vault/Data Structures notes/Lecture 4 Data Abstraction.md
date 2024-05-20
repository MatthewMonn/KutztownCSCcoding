**Object-Oriented Analysis & Design (OOAD)**
* A Process for solving problems
* A Solution is a computer program consisting  
of system of _interacting classes of objects_
* An object  
	– Has set of characteristics, behaviors related to  
	solution

**Object**
* Could be
	– Real-world object  
	– Software system  
	– Idea
	![[Pasted image 20231025103851.png]]

**Several important concepts**

* _Encapsulation_: hide inner details  
	– Function encapsulates behavior  
	– Object encapsulates _behavior and data_  
* Inheritance  
* Polymorphism

**Cohesion**
* Each module should perform _one_ well-defined task (_highly cohesive_)  
• Benefits  
	– Well named, self-documenting  
	– Easy to reuse  
	– Easier to maintain  
	– More robust

**Coupling**
* Measure of dependence among modules  
* Dependence  
	– Sharing data structures or calling each other’s methods  
* Modules should be _loosely_ coupled  
	– Highly coupled modules should be avoided

**Benefits of loose coupling**
* More adaptable to change  
* Easier to understand  
* Increases reusability  
* Has increased cohesion
![[Pasted image 20231025104407.png]]
![[Pasted image 20231025104420.png]]

**Specification of a module**
![[Pasted image 20231025104441.png]]

**==Operation contract== of a module**
* Documents (within header files)  
	– How method can be used  
	– What limitations it has  
* Specify  
	– Purpose of modules  
	– Data flow among modules  
	– Pre-, post-condition, input, output of each module

**Data Flow**
* Questions to specify  
	– What data is available before execution of the module?  
	– What does the module assume?  
	– What does the data look like after the module executes?  ![[Pasted image 20231025104623.png]]

![[Pasted image 20231025104654.png]]

**Unusual Conditions** 
* Ways to address invalid conditions:  
	–Assume they will not happen (precondition)  
	–Ignore such situations (do nothing)  
	–Guess at client’s intentions  
	–Return value that signals problem  
	–Throw an exception

**Abstraction**
* _Separate_ purpose of a module from its implementation  
* Specifications do not indicate how to implement  
	– Able to use without knowing implementation

**Information Hiding**
*  Identify details that should be _hidden_  
	– Ensured hidden details are private  
*  Clients are given a public interface  
	– what tasks can be done, how to initiate a task

![[Pasted image 20231025132150.png]]
![[Pasted image 20231025132214.png]]

**Minimal and Complete Interfaces**
*  Interface: publicly accessible methods and data  
*  _Two_ characteristics  
	– Complete  
	– Minimal

**Typical operations on data**
* _Add_ data to a data collection.  
* _Remove_ data from a data collection.  
* Ask questions (==query==) about the data in a data collection

**Abstract Data Types (ADT)**

* An _ADT_ : a collection of data and a set of operations on data  
*  A _data structure_ : an implementation of an ADT within a programming language
![[Pasted image 20231025132531.png]]
![[Pasted image 20231025132540.png]]

**Designing an ADT**
* Ask the following questions:  
	– What data does a problem require?  
	– What operations does a problem require?  
*  Problem: List all holidays of a given year
![[Pasted image 20231025132625.png]]
![[Pasted image 20231025132639.png]]
![[Pasted image 20231025132649.png]]

**ADTs That Suggest Other ADTs**
* A database of recipes ADT
![[Pasted image 20231025132724.png]]

* May suggest a measurement ADT
![[Pasted image 20231025132745.png]]

**The ADT Bag**

* Inspired by an actual physical bag  
* Doesn’t do much more than contain its items  
* Contain unordered and possibly duplicate objects  
* We insist objects be of same or similar types
![[Pasted image 20231025132842.png]]
![[Pasted image 20231025132850.png]]

**An Interface Template for the ADT**
![[Pasted image 20231025132918.png]]
![[Pasted image 20231025132925.png]]
![[Pasted image 20231025132935.png]]

**Using the ADT Bag**
![[Pasted image 20231025133002.png]]
![[Pasted image 20231025133009.png]]

**Next Lecture**
[[Lecture 5 Recursion]]



