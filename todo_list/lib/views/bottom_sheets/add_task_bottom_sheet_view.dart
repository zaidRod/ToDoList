import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/view_models/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controla lo que se vaya escribiendo el text field
    final TextEditingController entryController = TextEditingController();

    //El consumer toca cualquier cambio del appview model y refresca el witget
    return Consumer<AppViewModel>(builder: (context, AppViewModel, child) {
      //Retorna la vista al contenedor inferior

      return Padding(
        //el pading empuja el contenedor arriba para que se pueda ver lo que se escribe
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          //Centra el sizedbox que contiene el textfield
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                //Envia la informacion escrita el textfield
                onSubmitted: (value) {
                  //Si la caja de texto no esta vacia

                  //NO ESTOY USANDO ESTA CLASE
                  if (entryController.text.isNotEmpty) {
                    Task newTask = Task(entryController.text, "//", "", false);
                    AppViewModel.addTask(newTask);
                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  filled: true,
                  fillColor: AppViewModel.clrlv2,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                cursorColor: AppViewModel.clrlv4,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                //al presionar le boton abrira inmediatamente el teclado
                autofocus: true,
                controller: entryController,
                style: TextStyle(
                    color: AppViewModel.clrlv4,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      );
    });
  }
}
