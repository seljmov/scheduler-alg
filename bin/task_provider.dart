import 'package:collection/collection.dart';

import 'task_model.dart';
import 'task_status.dart';

var now = DateTime.parse("2022-03-01 09:00");

class TaskProvider {
  List<Task> getTasksForTest() {
    return [
      Task(
        id: 0,
        name: "ЛР №1 по БД",
        caption: "Установка PostgreSQL",
        deadline: DateTime.parse("2022-04-02 10:00"),
        labor: 150,
        priority: 8,
      ),
      Task(
        id: 1,
        name: "ЛР №2 по БД",
        deadline: DateTime.parse("2022-04-07 10:00"),
        labor: 150,
        priority: 8,
        dependsIds: [0],
      ),
      Task(
        id: 2,
        name: "Написать устав для КП",
        deadline: DateTime.parse("2022-04-10 10:00"),
        labor: 150,
        priority: 8,
      ),
      Task(
        id: 3,
        name: "ЛР №2 по Сетям",
        deadline: DateTime.parse("2022-03-15 10:00"),
        labor: 360,
        priority: 8,
      ),
      Task(
        id: 4,
        name: "Пройти курс по АД",
        deadline: DateTime.parse("2022-03-25 10:00"),
        labor: 480,
        priority: 8,
      ),
      Task(
        id: 5,
        name: "Курсовой проект по БД",
        deadline: DateTime.parse("2022-05-25 10:00"),
        labor: -1,
        priority: -1,
        subtasksIds: [6, 7, 8, 9, 10],
      ),
      Task(
        id: 6,
        name: "Введение",
        deadline: DateTime.parse("2022-04-10 10:00"),
        labor: 180,
        priority: 3,
      ),
      Task(
        id: 7,
        name: "Технический проект",
        deadline: DateTime.parse("2022-01-20 10:00"),
        labor: 300,
        priority: 3,
      ),
      Task(
        id: 8,
        name: "Программный продукт",
        deadline: DateTime.parse("2022-05-03 10:00"),
        labor: 480,
        priority: 3,
      ),
      Task(
        id: 9,
        name: "Методика испытания и тестирования",
        deadline: DateTime.parse("2022-05-06 10:00"),
        labor: 120,
        priority: 3,
      ),
      Task(
        id: 10,
        name: "Заключение",
        deadline: DateTime.parse("2022-05-08 10:00"),
        labor: 60,
        priority: 3,
      ),
      Task(
        id: 11,
        name: "ЛР №6 по БД",
        deadline: DateTime.parse("2022-03-04 09:00"),
        labor: 240,
        priority: 8,
      ),
      Task(
        id: 12,
        name: "ЛР №1 по АД",
        caption: "Установка Linux-сервера",
        deadline: DateTime.parse("2022-03-05 09:00"),
        labor: 60,
        priority: 4,
      ),
      Task(
        id: 13,
        name: "ЛР №2 по АД",
        deadline: DateTime.parse("2022-03-05 09:00"),
        labor: 60,
        priority: 4,
        dependsIds: [12],
      ),
      Task(
        id: 14,
        name: "ЛР №1 по Сетям",
        deadline: DateTime.parse("2022-03-03 09:00"),
        labor: 90,
        priority: 10,
      ),
    ]
        .where((task) =>
            task.subtasksIds.isEmpty &&
            task.status != TaskStatus.isCompleted &&
            task.status != TaskStatus.isOverdue)
        .toList();
  }

  Task? getTaskById(int id) {
    var tasks = getTasksForTest();
    return tasks.firstWhereOrNull(
      (task) => task.id == id,
    );
  }
}
