import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/campeones.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/view_models/app_view_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, AppViewModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
              autofocus: true,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppViewModel.clrlv3,
                  foregroundColor: AppViewModel.clrlv2,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),

              //Defino la funcion del boton
              onPressed: () async {
                if (AppViewModel.borrado == false) {
                  //Creo el listado de campeones y los agrego al listado de tareas
                  List<Campeon> listado = await AppViewModel.getCampeones();
                  for (var i = 0; i < listado.length; i++) {
                    AppViewModel.addTask(
                        Task(listado[i].nombre, listado[i].imagen, false));
                  }
                  AppViewModel.borrado = true;
                } else {}
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    size: 25,
                  ),
                  Text("Cargar info")
                ],
              )),
        );
      },
    );
  }
}
