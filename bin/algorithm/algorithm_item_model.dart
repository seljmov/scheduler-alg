class AlgorithmItem {
  final int id;
  final DateTime deadline;
  final double labor;
  final int priority;
  final List<int> dependsIds;

  AlgorithmItem({
    required this.id,
    required this.deadline,
    required this.labor,
    required this.priority,
    this.dependsIds = const <int>[],
  });
}
