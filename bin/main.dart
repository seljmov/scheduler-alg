import 'algorithm/scheduler_algorithm.dart';
import 'task_provider.dart';

void main(List<String> arguments) {
  var tasks = TaskProvider().getTasksForTest();

  var alg = SchedulerAlgorithm(tasks: tasks);
  alg.run();
}
