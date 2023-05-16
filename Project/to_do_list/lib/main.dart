import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tasks = [];
  List<String> completedTasks = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(String task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void completeTask(String task) {
    setState(() {
      tasks.remove(task);
      completedTasks.add(task);
    });
  }

  void removeCompletedTask(String task) {
    setState(() {
      completedTasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TaskListTab(
            tasks: tasks,
            removeTask: removeTask,
            completeTask: completeTask,
          ),
          CompletedTasksTab(
            completedTasks: completedTasks,
            removeCompletedTask: removeCompletedTask,
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.list), text: 'TasksList'),
          Tab(icon: Icon(Icons.done_all), text: 'TasksDone'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTaskDialog(
                addTask: addTask,
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  final Function(String) addTask;

  AddTaskDialog({required this.addTask});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(labelText: 'Task'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            String task = _textEditingController.text;
            if (task.isNotEmpty) {
              widget.addTask(task);
            }
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class TaskListTab extends StatelessWidget {
  final List<String> tasks;
  final Function(String) removeTask;
  final Function(String) completeTask;

  TaskListTab({
    required this.tasks,
    required this.removeTask,
    required this.completeTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(
            task,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                  completeTask(task);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Task'),
                        content: Text('Are you sure you want to delete this?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              removeTask(task);
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CompletedTasksTab extends StatelessWidget {
  final List<String> completedTasks;
  final Function(String) removeCompletedTask;

  CompletedTasksTab({
    required this.completedTasks,
    required this.removeCompletedTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        final task = completedTasks[index];
        return ListTile(
          title: Text(
            task,
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeCompletedTask(task);
            },
          ),
        );
      },
    );
  }
}
