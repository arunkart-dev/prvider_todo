class Todomodel {
  String title;
  String description;
  DateTime date;
  bool completed;
  Todomodel({
    required this.title,
    required this.description,
    required this.date,
    required this.completed,
  });
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "date": date.toIso8601String(),
      "completed": completed,
    };
  }

  factory Todomodel.fromMap(Map<String, dynamic> map) {
    return Todomodel(
      title: map["title"],
      description: map["description"],
      date: DateTime.parse(map["date"]),
      completed: map["completed"] is int ? map["completed"]==1 : map["completed"]
    );
  }
}
