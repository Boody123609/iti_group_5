class UserModel {
  int? userId;
  String? id;
  String? title;
  bool? completed;

  UserModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
