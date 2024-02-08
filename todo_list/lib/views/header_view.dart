import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo_list/views/bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, AppViewModel, child) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Bienvenido invocador",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w300,
                                color: AppViewModel.clrlv4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          //Ayuda a mantener el espacio en el alto del header en diferentes dispositivos
                          fit: BoxFit.fitHeight,
                          child: Text(
                            AppViewModel.username,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppViewModel.clrlv4),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Boton de borrado
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    AppViewModel.bottomSheetBuilder(
                        DeleteBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: AppViewModel.clrlv3,
                    size: 40,
                  ),
                )),

            //Boton de settings
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    AppViewModel.bottomSheetBuilder(
                        SettingsBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.settings,
                    color: AppViewModel.clrlv3,
                    size: 40,
                  ),
                ))
          ],
        );
      },
    );
  }
}
