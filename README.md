##  Detail about the todo app
demo video = https://www.loom.com/share/adc5b50c8a5543278f8a21e9a503ff8e

# Database structure.

I only used 3 collections even though you suggested 4. 
I didn't want to use shiftCollection, Because shift can be an enum and we can use it in task and user model. 
 enum ShiftType {
  morning,
  evening,
  night,
}. 
Relationship between user, task, and resident.

Every task has a user(nurse) and resident associated with it.
Every user belongs to some shift, so every task has a shift. 
Every user can view all tasks of his/her shift.
Every task has a resident, every user has a resident he/she should check on.

# Flutter App.

I have used Stacked Architecture to separate business logic from UI component 
There is nothing hard-coded in the app, no hard-coded users, no hard-coded data, and no hardcoded task. 
You can create an account, log in with that account, and use the app. simple. 
The app starts from Calander view, which will show you the calendar and the list of tasks if there is any on selected data,
You can add tasks.
You can create a resident,
You can search for residents,
You can transfer a task,
You can mark a task as done,
You can change your shift,
You can logout.

# UI Part
Noting copied from the internet, I have worked with amazing UI/UX designers and learned how to implement clean and simple UI. Tried to use Dexter's logo color (red one) as the primary color but didn't work out.


Anything else I can add If I have enough time?
1. Changing manual task transfer into automatic using google cloud-scheduler. This scheduler runs on every shift end-time and checks all pending tasks and transfers them to the next shift.
2. Manage user session (Which is minor). Firebase does this for us the only thing we need to add is StartUpView which will check startuplogics(A custom function that will check user session, the current user status and etc)  for the app. 
3. There are a lot of things that we should consider. For example tracking every single detail of a task, like updating, deleting, tracking all completed tasks, pending tasks, filtering tasks by status, filtering tasks by priority, filtering by date, and adding local push notification that reminds user before the shift ends, adding remote pushing notification that notifies a user when a task transferred to their shift, removed from their shift and etc.
4. Unit testing is a pillar for building a quilty product. Every single function on the entire project should be tested. I really enjoy and love writing unit tests, but I didn't write unit tests for this project because of the time limit. 
5. May have a better UI, I didn't search on the internet for this app, I did all the UIs from my experience.
6. Account view options should be implemented.
7. All Social Sign in options 
8. Add comments to each and every function. Probable this project is the first project that I haven't written a single comment on. 
9. Allowing users to update their information.
10. Add an internet connection checker service that will be used throughout the app.
11. Add a dialog or snack bar that will show the user the result of actions(error).
12. Give a user trying again option if something happens while fetching data.
13. Add mixins and remove if there is a single line of code duplication.
14. Add detail view that will show the detail of task when taping on task.
15. Add detail view that will show resident detail when taping of resident.
16. Add updating and deleting option for all documents. (I have implemented it as abstract class)



# dexter_code_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


