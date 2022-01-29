# Show-Off-Test-Michal
show off test for assingment

Questions: 
1. What is iOS: 

iOS is a mobile operating system for iPhone, iPad, and other Apple mobile devices, that was developed by Apple.

2. What is a Cocoa Touch class?

Cocoa Touch is a UI Framework used for building software programs to run on iOS. 
You can think of it as a swift file that comes "ready made" with a few things for you to use. 
For example, the UITableViewController Cocoa Touch object comes pre-filled with methods necessary to make the table view work.

3. Describe app lifecycle?

Not Running state: The app has not been launched or terminated by the system.
Inactive state: The app is entering the foreground state but not receiving events.
Active state The app enters the foreground state and can process event.
Background state: In this state, if there is executable code, it will execute and if there is no executable code or the execution is complete, the application will be suspended immediately.
Suspended state: The app is in the background(in memory) but is not executing code and if system does not have enough memory, it will terminate the app.

4. Give example scenarios when an application goes into InActive state?

The app is running in the foreground but is currently not receiving events. (It may be executing other code though.) 
An app usually stays in this state only briefly as it transitions to a different state.
exmaple sceneraios: Receiving a call while the app is in the foreground.

5. What is an AdHoc certificate?

The Ad-Hoc certificate allows you to build your app to run on a predetermined list of devices. 

6. What is a Singleton class? Where would you use it in the application and how?

A singleton class is a class that can have only one object (an instance of the class) at a time. After the first time, if we try to instantiate the Singleton class, the new variable also points to the first instance created. 
Other classes are having access the functions and variables of the same singleton reference.
Usually you would use it in the application to hold information and functions that are being used in other classes such as user info (name, address, language and so on.)

7. What's the difference between synchronous and asynchronous calls in Objective-C? 

When you invoke something synchronously, it means that the thread that initiated that operation will wait for the task to finish before continuing. 
Asynchronous means that it will not wait.

8. What is a dispatch ? give an example:

The Grand Central Dispatch (GCD) offers great flexibility and options when trying to achieve concurrency, performance, and parallel tasks.
A DispatchQueue is an abstraction layer on top of the GCD queue that allows you to perform tasks asynchronously and concurrently in your application. 
Tasks are always executed in FIFO (first in first out) order.
there are several differenet dispatch queues that perform the tasks in their order. 
For instance, the Serial queue waits for other tasks to finish before running the task.
You could use dispatch queue to send certain operation to other threads, such as the background thread, to clear the main thread and have the app run smoother.

9. What is delegates/Protocol ? give example of use it

A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
Any class or struct that inherits a protocol must have an implementation to the methods defined by the protocol.
If a class or struct conforms to a certain protocol guarantees that it contains the methods in that protocol. 
Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type. 
This design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities, such that a conforming type (known as a delegate) is guaranteed to provide the functionality that has been delegated. 
For instance if a view inside a view controller wants to invoke a function in the view controller, a good way to implement this would be to define a protocol that the view controller would conform to and then delegate the view contoller to the contained view, then when it needs to, the view would invoke a function of the delegate assigned to it, and the view controller will know that this function has been called and perform it.
a UITableView Delegate works the same way.

10. Have you uploaded an app to the app store?

I haven't.

If yes: what is the process? Describe the process End-To-End.

I haven't had the chance yet, since I am developing and releasing with Firebase.
but the process is: 
* Assemble App Store Information
* Create a Bundle Identifier
* Create a Certificate Signing Request
* Create an App Store Production Certificate
* Create a Production Provisioning Profile
* Create an App Store Listing
* Create a Release Build
* Fill in the Version Information
* Submit Version for Review
* Release





