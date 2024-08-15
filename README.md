# To Do List - Flutter App
## Description
To Do List is a simple and efficient task management app built using Flutter. The app allows users to create, manage, and store to-do tasks. It's designed with a clean interface and persistent storage to keep your tasks saved, even when the app is closed.

## Features:
Add and delete to-do tasks.
View tasks in a list format.
Mark tasks as done and remove them from the list.
Persistent data storage using SharedPreferences.
Dynamic UI updates using state management.
## Learning Outcomes
While developing this app, I learned and implemented the following Flutter concepts:

## Widgets and UI Elements
Scaffold & AppBar: Used to structure the layout and create actions in the app bar.
Drawer: Implemented a navigation drawer to provide additional menu options.
GestureDetector & InkWell: Used to capture taps and interactions with UI components.
BottomSheet: Displayed a modal sheet to allow users to add new tasks.
TextEditingController: Managed text input for task creation.
ListView.builder: Dynamically rendered the list of tasks.
ListTile: Displayed individual tasks in the to-do list.
Dismissible: Allowed users to swipe away tasks.
AlertDialog: Used to show alerts for task-related actions.
## Data Management
State Management: Updated the task list in real-time using setState().
Lists: Manipulated task data with lists and dynamic updates.
Parent-to-Child Communication: Passed data and callbacks between parent and child widgets for task management.
SharedPreferences: Preserved tasks locally so that they remain even after closing the app.
Conditional Rendering: Rendered widgets based on the availability of tasks in the list to provide user feedback when the list is empty.
# How to Run the App
## Clone this repository:


git clone https://github.com/YourUsername/ToDoListApp.git

### Navigate to the project folder:


cd ToDoListApp
### Install dependencies:


flutter pub get
### Run the app:


flutter run


## Future Enhancements
Add notifications for pending tasks.
Implement sorting and filtering options.
Add the ability to edit tasks.
Improve UI design with themes and animations.