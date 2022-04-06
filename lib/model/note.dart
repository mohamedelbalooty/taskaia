import 'database_model.dart';

class Note extends DatabaseModel {
  // final String image;
  Note(
      {int? id,
      required String title,
      required String content,
      required String dateTime,
      required int color})
      : super(
            id: id,
            title: title,
            content: content,
            dateTime: dateTime,
            color: color);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      dateTime: json['dateTime'],
      color: json['color'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime': dateTime,
      'color': color,
    };
  }
}
