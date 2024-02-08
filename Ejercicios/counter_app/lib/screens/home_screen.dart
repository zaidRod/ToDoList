import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Creo variable
    const fontSize30 = TextStyle(fontSize: 40);
    int contador = 17;

    //Lienzo para colocar mis witgets
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          elevation: 0,
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Número de Clicks', style: fontSize30),
              Text('$contador', style: fontSize30),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              contador++;
              print("Hola mundo");
              print(contador);
            }));
  }
}
