import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imageUrl;

  MyImageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return child;
        }
        return CircularProgressIndicator(); // Mostrar un indicador de carga mientras se carga la imagen
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons
            .error); // Mostrar un icono de error si la carga de la imagen falla
      },
    );
  }
}
