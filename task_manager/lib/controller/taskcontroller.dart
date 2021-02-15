import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/model/task.dart';

class TaskController extends GetxController {
  final selectedTodayTaskIndex = 0.obs;
  bool get isLastTask => selectedTodayTaskIndex.value == taskList.length - 1;
  var pageController =
      PageController(keepPage: true, initialPage: 0, viewportFraction: 0.8);

  nextTaskSelector() {
    if (isLastTask) {
    } else {
      pageController.nextPage(
          duration: 600.milliseconds, curve: Curves.bounceInOut);
    }
  }
}

List<Task> taskList = [
  Task(
    id: 0,
    title: 'Realizar el UI',
    content: 'Se toma del diseño de Dribble de Anastasia',
    createdBy: 'Sebastian',
    assignatedTo: 'Sebastian Esclavo',
    createdDate: DateTime.now(),
    dueDate: DateTime.now(),
  ),
  Task(
    id: 1,
    title: 'Crear el Backend',
    content: 'Basarse en el Backend de la primera aplicación de usuario',
    createdBy: 'Sebastian',
    assignatedTo: 'Sebastian Esclavitud',
    createdDate: DateTime.now(),
    dueDate: DateTime.now(),
  ),
  Task(
    id: 2,
    title: 'Realizar el UI',
    content: 'Se toma del diseño de Dribble de Anastasia',
    createdBy: 'Sebastian',
    assignatedTo: 'Sebastian Esclavo',
    createdDate: DateTime.now(),
    dueDate: DateTime.now(),
  ),
  Task(
    id: 0,
    title: 'Realizar el UI',
    content: 'Se toma del diseño de Dribble de Anastasia',
    createdBy: 'Sebastian',
    assignatedTo: 'Sebastian Esclavo',
    createdDate: DateTime.now(),
    dueDate: DateTime.now(),
  ),
];
