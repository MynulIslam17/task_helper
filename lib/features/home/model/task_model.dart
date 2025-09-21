class TaskModel {
  final String id;
  final String title;
  final String description;
  final String createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "title": title,
      "description": description,
      "createdAt": createdAt,
    };
  }
}
