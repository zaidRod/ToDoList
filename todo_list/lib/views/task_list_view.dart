import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/fila_campeones.dart';

class taskListView extends StatelessWidget {
  const taskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, AppViewModel, child) {
      return Container(
        decoration: BoxDecoration(
            color: AppViewModel.clrlv2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView.separated(
          padding: EdgeInsets.all(15),
          //Es el pequeño espacio entre cada tarea
          separatorBuilder: (context, index) {
            return SizedBox(height: 15);
          },
          //la cantidad de tareas creadas
          itemCount: AppViewModel.numTasks,
          // Es el elemento que se muestra en pantalla
          itemBuilder: (context, index) {
            final mi = index;
            return Dismissible(
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.red.shade700,
                  ),
                ),
              ),
              key: UniqueKey(),
              //Cuando deslizo se borra del listado
              onDismissed: (direction) {
                AppViewModel.deleteTask(index);
              },

              child: Container(
                decoration: BoxDecoration(
                    color: AppViewModel.clrlv1,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(width: 2, color: AppViewModel.clrlv3),
                    checkColor: AppViewModel.clrlv1,
                    activeColor: AppViewModel.clrlv3,
                    //verifico el estaod de la tarea
                    value: AppViewModel.getTaskValue(index),
                    onChanged: (value) {
                      AppViewModel.setTaskValue(index, value!);
                    },
                  ),
                  //Muestra el titulo de la tarea
                  title: Row(
                    children: [
                      MyImageWidget(imageUrl: AppViewModel.tasks[index].image),
                      Text(AppViewModel.taskTitle(index),
                          style: TextStyle(
                            color: AppViewModel.clrlv4,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
