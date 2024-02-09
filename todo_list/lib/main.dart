import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/task_page.dart';

void main() {
  //Creo el change notifier para informar de los cambios de estado
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Asigno a la variable el listado de los campeones
    //AppViewModel().getCampeones();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
