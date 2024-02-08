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
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),

              //Defino la funcion del boton
              onPressed: () async {
                //Creo el listado de campeones y los agrego al listado de tareas
                List<Campeon> listado = await AppViewModel.getCampeones();
                for (var i = 0; i < listado.length; i++) {
                  AppViewModel.addTask(
                      Task(listado[i].nombre, listado[i].imagen, false));
                }

                /*
                // Al presionarlo llamo a la funcio que construye el contenedor inferior
                AppViewModel().bottomSheetBuilder(
                    //Llamo a la clse add task para que retorne el contenedor que ya tiene creado
                    const AddTaskBottomSheetView(),
                    context);
                    */
              },
              child: const Icon(
                Icons.add,
                size: 30,
              )),
        );
      },
    );
  }
}
