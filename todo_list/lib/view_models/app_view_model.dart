import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_list/models/campeones.dart';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  //Creo el listado de tareas
  List<Task> tasks = <Task>[];

  //evito que se cargen dos veces los datos
  bool borrado = false;
//Verifico que se estan cargado los datos
  bool cargando = true;
  //Verifico que se ha presionado el boton
  bool presionado = false;
  //Creo el usuario
  User user = User("Invocador");

  Color clrlv1 = Colors.grey.shade50;
  Color clrlv2 = Colors.grey.shade200;
  Color clrlv3 = Colors.grey.shade800;
  Color clrlv4 = Colors.grey.shade900;
//muestra la cantidad de tareas para el widget
  int get numTasks => tasks.length;

  //numero de tareas pendientes
  int get numTaskRemining => tasks.where((task) => !task.complete).length;

  //muestra si las tareas estan completadas
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

// Creo el metodo para agregar la tarea
  void addTask(Task newTask) {
    tasks.add(newTask);
    //Notifico los listeners para actualizar el UI
    notifyListeners();
  }

  //Strig que retorna le usuario
  String get username => user.username;

  //Creo el metodo para cambiar el estado de la tarea
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  //metodo que retorna el nombre del tarea
  //No hace falta notificar nada por que no esta cambiando nuestra informacion
  String taskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  //funcion que retorna la url de la imagen
  String taskImage(int taskIndex) {
    return tasks[taskIndex].image;
  }

  //funcion que actualiza el nombre del usuario
  void updateUsername(String newUsername) {
    user.username = newUsername;
    //Actualizacion de ifo
    notifyListeners();
  }

  //funcion para borrar los elementos, como hare cambios notifico los listeners
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  //Funcion que borra todas las tareas
  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  //Funcion de borrar tareas completadas
  void deleteCompletedTasks() {
    //creo una nueva lista donde se guandan solo las tareas completadas
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

// Creo la funcion que construira la caja inferior de la app
  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return bottomSheetView;
        });
  }

// Creo el metodo que carga la lista de todos los campeones

  Future<List<Campeon>> getCampeones() async {
    var url = Uri.parse(
        "https://league-of-legends-champions.onrender.com/App/Champions");

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      // Convierto la salida del api a UTF8
      String body = utf8.decode(respuesta.bodyBytes);
      //Conviero el body a json
      final jsonData = jsonDecode(body);

      List<Campeon> campeones = [];
      //Cargo la lista de campeones
      for (var i = 0; i < 20; i++) {
        campeones.add(Campeon(jsonData[i]["champion"], jsonData[i]["img"],
            jsonData[i]["origen"], jsonData[i]["position"][0]["icon"]));
      }
      //Los imprimo
      for (var i = 0; i < 20; i++) {
        print(campeones[i].posicion);
      }
      // Retorno el listado de los campeones
      return campeones;
    } else {
      throw Exception("Problema de conexión");
    }
  }
}
