import 'package:collection/collection.dart';

import 'task_model.dart';
import 'task_priority.dart';
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
    description: "Установка PostgreSQL",
    deadline: DateTime.parse("2022-09-24 10:00"),
    labor: 60 * 60 * 2, // 2 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 1,
    name: "ЛР №2 по БД",
    deadline: DateTime.parse("2022-10-01 10:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.medium,
    dependIds: [0],
  ),
  TaskModel(
    id: 2,
    name: "Написать устав для КП",
    deadline: DateTime.parse("2022-11-10 10:00"),
    labor: 60 * 60 * 8, // 8 часов
    priority: TaskPriority.medium,
  ),
  TaskModel(
    id: 3,
    name: "ЛР №1 по Сетям",
    deadline: DateTime.parse("2022-10-15 10:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 4,
    name: "Пройти курс по АД",
    deadline: DateTime.parse("2022-12-25 10:00"),
    priority: TaskPriority.high,
    subtasksIds: [12, 13, 15, 16, 17, 18],
  ),
  TaskModel(
    id: 5,
    name: "Курсовой проект по БД",
    deadline: DateTime.parse("2022-12-25 10:00"),
    priority: TaskPriority.extraHigh,
    subtasksIds: [6, 7, 8, 9, 10],
  ),
  TaskModel(
    id: 6,
    name: "Введение",
    deadline: DateTime.parse("2022-11-01 10:00"),
    labor: 60 * 60 * 1.5, // 1.5 час
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 7,
    name: "Технический проект",
    deadline: DateTime.parse("2022-11-15 10:00"),
    labor: 60 * 60 * 3, // 3 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 8,
    name: "Программный продукт",
    deadline: DateTime.parse("2022-12-02 10:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 9,
    name: "Методика испытания и тестирования",
    deadline: DateTime.parse("2022-12-06 10:00"),
    labor: 60 * 60 * 1, // 1 час
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 10,
    name: "Заключение",
    deadline: DateTime.parse("2022-12-08 10:00"),
    labor: 60 * 60 * 0.5, // 0.5 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 11,
    name: "ЛР №3 по БД",
    deadline: DateTime.parse("2022-10-04 09:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
    dependIds: [1],
  ),
  TaskModel(
    id: 12,
    name: "ЛР №1 по АД",
    description: "Установка Linux-сервера",
    deadline: DateTime.parse("2022-09-28 09:00"),
    labor: 60 * 60 * 2, // 2 часа
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: 13,
    name: "ЛР №2 по АД",
    deadline: DateTime.parse("2022-10-05 09:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
    dependIds: [12],
  ),
  TaskModel(
    id: 14,
    name: "ЛР №2 по Сетям",
    deadline: DateTime.parse("2022-10-03 09:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
    dependIds: [3],
  ),
  TaskModel(
    id: 15,
    name: "ЛР №3 по АД",
    deadline: DateTime.parse("2022-10-15 09:00"),
    labor: 60 * 60 * 2, // 2 часа
    priority: TaskPriority.medium,
    dependIds: [12],
  ),
  TaskModel(
    id: 16,
    name: "ЛР №4 по АД",
    deadline: DateTime.parse("2022-10-25 09:00"),
    labor: 60 * 60 * 2.5, // 2.5 часа
    priority: TaskPriority.medium,
    dependIds: [12],
  ),
  TaskModel(
    id: 17,
    name: "ЛР №5 по АД",
    deadline: DateTime.parse("2022-10-15 09:00"),
    labor: 60 * 60 * 3, // 3 часа
    priority: TaskPriority.medium,
    dependIds: [12],
  ),
  TaskModel(
    id: 18,
    name: "ЛР №6 по АД",
    deadline: DateTime.parse("2022-10-25 09:00"),
    labor: 60 * 60 * 2, // 2 часа
    priority: TaskPriority.medium,
    dependIds: [12],
  ),
  TaskModel(
    id: 19,
    name: "ЛР №4 по БД",
    deadline: DateTime.parse("2022-10-11 09:00"),
    labor: 60 * 60 * 4, // 4 часа
    priority: TaskPriority.high,
    dependIds: [1],
  ),
  TaskModel(
    id: 20,
    name: "ЛР №5 по БД",
    deadline: DateTime.parse("2022-10-23 09:00"),
    labor: 60 * 60 * 2, // 2 часа
    priority: TaskPriority.high,
    dependIds: [1],
  ),
  TaskModel(
    id: 21,
    name: "ЛР №6 по БД",
    deadline: DateTime.parse("2022-11-02 09:00"),
    labor: 60 * 60 * 5, // 5 часов
    priority: TaskPriority.high,
    dependIds: [1],
  ),
  TaskModel(
    id: 22,
    name: "Пройти курс по Базам Данных",
    deadline: DateTime.parse("2022-12-25 10:00"),
    priority: TaskPriority.high,
    subtasksIds: [0, 1, 11, 19, 20, 21],
  ),
];
