abstract class DatabaseModel {
  final int? id;
  final int color;
  final String title, content, dateTime;

  DatabaseModel(
      {this.id,
      required this.title,
      required this.content,
      required this.dateTime,
      required this.color});

  Map<String, dynamic> toJson();
}
