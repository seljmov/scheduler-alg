import 'package:collection/collection.dart';

import 'task_model.dart';
import 'task_status.dart';

class TaskProvider {
  List<TaskModel> getTasksToPlanning() {
    return _testTasksBase
        .where((task) =>
            task.subtasksIds.isEmpty &&
            task.status != TaskStatus.isCompleted &&
            task.status != TaskStatus.isOverdue)
        .toList();
  }

  TaskModel? getTaskById(int id) {
    return _testTasksBase.firstWhereOrNull(
      (task) => task.id == id,
    );
  }
}

var _testTasksBase = [
  TaskModel(
    id: 0,
    name: "ЛР №1 по БД",
    caption: "Установка PostgreSQL",
    deadline: DateTime.parse("2022-11-02 10:00"),
    labor: 150,
    priority: 8,
  ),
  TaskModel(
    id: 1,
    name: "ЛР №2 по БД",
    deadline: DateTime.parse("2022-11-07 10:00"),
    labor: 150,
    priority: 8,
    dependsIds: [0],
  ),
  TaskModel(
    id: 2,
    name: "Написать устав для КП",
    deadline: DateTime.parse("2022-11-10 10:00"),
    labor: 150,
    priority: 8,
  ),
  TaskModel(
    id: 3,
    name: "ЛР №1 по Сетям",
    deadline: DateTime.parse("2022-10-15 10:00"),
    labor: 90,
    priority: 10,
  ),
  TaskModel(
    id: 4,
    name: "Пройти курс по АД",
    deadline: DateTime.parse("2022-12-25 10:00"),
    subtasksIds: [12, 13],
  ),
  TaskModel(
    id: 5,
    name: "Курсовой проект по БД",
    deadline: DateTime.parse("2022-12-25 10:00"),
    subtasksIds: [6, 7, 8, 9, 10],
  ),
  TaskModel(
    id: 6,
    name: "Введение",
    deadline: DateTime.parse("2022-11-10 10:00"),
    labor: 180,
    priority: 3,
  ),
  TaskModel(
    id: 7,
    name: "Технический проект",
    deadline: DateTime.parse("2022-11-20 10:00"),
    labor: 300,
    priority: 3,
  ),
  TaskModel(
    id: 8,
    name: "Программный продукт",
    deadline: DateTime.parse("2022-12-03 10:00"),
    labor: 480,
    priority: 3,
  ),
  TaskModel(
    id: 9,
    name: "Методика испытания и тестирования",
    deadline: DateTime.parse("2022-12-06 10:00"),
    labor: 120,
    priority: 3,
  ),
  TaskModel(
    id: 10,
    name: "Заключение",
    deadline: DateTime.parse("2022-12-08 10:00"),
    labor: 60,
    priority: 3,
  ),
  TaskModel(
    id: 11,
    name: "ЛР №3 по БД",
    deadline: DateTime.parse("2022-10-04 09:00"),
    labor: 240,
    priority: 8,
    dependsIds: [1],
  ),
  TaskModel(
    id: 12,
    name: "ЛР №1 по АД",
    caption: "Установка Linux-сервера",
    deadline: DateTime.parse("2022-10-05 09:00"),
    labor: 60,
    priority: 4,
  ),
  TaskModel(
    id: 13,
    name: "ЛР №2 по АД",
    deadline: DateTime.parse("2022-10-05 09:00"),
    labor: 60,
    priority: 4,
    dependsIds: [12],
  ),
  TaskModel(
    id: 14,
    name: "ЛР №2 по Сетям",
    deadline: DateTime.parse("2022-10-03 09:00"),
    labor: 360,
    priority: 8,
    dependsIds: [3],
  ),
];
