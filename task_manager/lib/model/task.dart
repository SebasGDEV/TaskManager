class Task {
  int id;
  String title;
  String content;
  String createdBy;
  String assignatedTo;
  DateTime createdDate;
  DateTime dueDate;

  Task({
    this.id,
    this.title,
    this.content,
    this.createdBy,
    this.assignatedTo,
    this.createdDate,
    this.dueDate,
  });
}
