import 'package:flutter/material.dart';
import 'package:todo_list/views/add_task_view.dart';
import 'package:todo_list/views/header_view.dart';
import 'package:todo_list/views/task_info_view.dart';
import 'package:todo_list/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              //Cabecera
              Expanded(flex: 1, child: HeaderView()),
              //Info tareaf
              Expanded(flex: 1, child: TaskInfoView()),
              //Listado de tareas
              Expanded(flex: 7, child: taskListView()),
            ],
          ),
        ),
        floatingActionButton: AddTaskView());
  }
}
