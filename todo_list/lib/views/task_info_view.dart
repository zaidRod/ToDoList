import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, AppViewModel, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            //Cantidad total de tareas
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppViewModel.clrlv2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "${AppViewModel.numTasks}",
                            style: TextStyle(
                                fontSize: 28,
                                color: AppViewModel.clrlv3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          child: Text("Total de campeones",
                              style: TextStyle(
                                  color: AppViewModel.clrlv4,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            // Cantidad de tareas pendientes
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppViewModel.clrlv2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "${AppViewModel.numTaskRemining}",
                            style: TextStyle(
                                fontSize: 28,
                                color: AppViewModel.clrlv3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          child: Text("Maestrias pendientes",
                              style: TextStyle(
                                  color: AppViewModel.clrlv4,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
