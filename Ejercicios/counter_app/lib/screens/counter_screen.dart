import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
//Propiedad
  int contador = 17;

  @override
  Widget build(BuildContext context) {
    //Creo variable
    const fontSize30 = TextStyle(fontSize: 40);

    //Lienzo para colocar mis witgets
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pantalla contadora"),
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
              setState(() {});
              print("Hola mundo");
              print(contador);
            }));
  }
}
