import 'database_model.dart';

class Task extends DatabaseModel {
  final String startTime, endTime, repeat;
  final int isCompleted, remind;

  Task(
      {int? id,
      required String title,
      required String content,
      required String dateTime,
      required int color,
      required this.endTime,
      required this.startTime,
      required this.repeat,
      required this.isCompleted,
      required this.remind})
      : super(
            id: id,
            title: title,
            content: content,
            dateTime: dateTime,
            color: color);

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      repeat: json['repeat'],
      dateTime: json['dateTime'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      isCompleted: json['isCompleted'],
      remind: json['remind'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'repeat': repeat,
      'date': dateTime,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'isCompleted': isCompleted,
      'remind': remind,
    };
  }
}
