import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imageUrl;

  MyImageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: 80,
        height: 80,
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          }
          return CircularProgressIndicator(); // Mostrar un indicador de carga mientras se carga la imagen
        },
        // Como la unica imagen que no cargo fue la de este campeon la inserto manualmente
        errorBuilder: (context, error, stackTrace) {
          return ClipOval(
            child: Image.network(
                "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/1/13/ApheliosSquare.png/revision/latest?cb=20200109121419",
                width: 80,
                height: 80, loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return CircularProgressIndicator(); // Mostrar un indicador de carga mientras se carga la imagen
            }),
          ); // Mostrar un icono de error si la carga de la imagen falla
        },
      ),
    );
  }
}
