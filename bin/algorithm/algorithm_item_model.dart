class AlgorithmItem {
  final int id;
  final int? parentId;
  final DateTime deadline;
  final double labor;
  final int priority;
  final List<int>? dependsIds;

  AlgorithmItem({
    required this.id,
    required this.deadline,
    required this.labor,
    required this.priority,
    this.parentId,
    this.dependsIds,
  });
}
