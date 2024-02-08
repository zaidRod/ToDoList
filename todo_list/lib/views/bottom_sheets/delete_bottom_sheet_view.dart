import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, AppViewModel, child) {
        return Container(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Boton de borrar todas las tareas
              ElevatedButton(
                  //Defino la funcion de borrar todo
                  onPressed: () {
                    AppViewModel.deleteAllTasks();
                    //Oculta el cuadro de texto con las opciones
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: AppViewModel.clrlv1,
                      backgroundColor: AppViewModel.clrlv3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  child: Text("Borrar todo")),
              SizedBox(
                width: 15,
              ),
              //Boton de borrar todas las tareas Completadas
              ElevatedButton(
                  onPressed: () {
                    AppViewModel.deleteCompletedTasks();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: AppViewModel.clrlv1,
                      backgroundColor: AppViewModel.clrlv3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  child: Text("Borrar completadas"))
            ],
          ),
        );
      },
    );
  }
}
