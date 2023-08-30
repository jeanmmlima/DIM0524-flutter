import 'dart:math';

import 'package:f02_todolist/components/lista_tarefa.dart';
import 'package:f02_todolist/models/tarefa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amber,
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> _tarefas = [
    Tarefa(id: 't0', titulo: 'Estudar', data: DateTime.now()),
    Tarefa(id: 't1', titulo: 'Jogar', data: DateTime.now()),
  ];

  final _tarefaController = TextEditingController();

  _novaTarefa() {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(),
        titulo: _tarefaController.text,
        data: DateTime.now());

    setState(() {
      _tarefas.add(novaTarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // formulario de tarefa
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: _tarefaController,
                    decoration:
                        const InputDecoration(labelText: 'nova tarefa...'),
                  ),
                  ElevatedButton(
                      onPressed: _novaTarefa, child: Text('Cadastrar tarefa'))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // lista de tarefas
            ListaTarefa(listaTarefas: _tarefas),
          ],
        ),
      ),
    );
  }
}
