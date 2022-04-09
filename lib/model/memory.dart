import '../utils/constants.dart';
import 'database_model.dart';

class Memory extends DatabaseModel {
  Memory(
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

  factory Memory.fromJson(Map<String, dynamic> json) {
    return Memory(
      id: json[memoryIdKey],
      title: json[memoryTitleKey],
      content: json[memoryContentKey],
      dateTime: json[memoryDatetimeKey],
      color: json[memoryColorKey],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      memoryTitleKey: title,
      memoryContentKey: content,
      memoryDatetimeKey: dateTime,
      memoryColorKey: color
    };
  }
}
