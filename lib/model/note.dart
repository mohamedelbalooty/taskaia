import '../utils/constants.dart';
import 'database_model.dart';

class Note extends DatabaseModel {
  final String? image;

  Note(
      {int? id,
      required String title,
      required String content,
      required String dateTime,
      required int color,
      this.image})
      : super(
            id: id,
            title: title,
            content: content,
            dateTime: dateTime,
            color: color);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json[noteIdKey],
        title: json[noteTitleKey],
        content: json[noteContentKey],
        dateTime: json[noteDatetimeKey],
        color: json[noteColorKey],
        image: json[noteImageKey]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      noteTitleKey: title,
      noteContentKey: content,
      noteDatetimeKey: dateTime,
      noteColorKey: color,
      noteImageKey: image
    };
  }
}
