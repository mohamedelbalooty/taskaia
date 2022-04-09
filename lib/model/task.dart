import '../utils/constants.dart';
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
      id: json[taskIdKey],
      title: json[taskTitleKey],
      content: json[taskContentKey],
      repeat: json[taskRepeatKey],
      dateTime: json[taskDatetimeKey],
      startTime: json[taskStartTimeKey],
      endTime: json[taskEndTimeKey],
      color: json[taskColorKey],
      isCompleted: json[taskIsCompletedKey],
      remind: json[taskReminderKey],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      taskTitleKey: title,
      taskContentKey: content,
      taskRepeatKey: repeat,
      taskDatetimeKey: dateTime,
      taskStartTimeKey: startTime,
      taskEndTimeKey: endTime,
      taskColorKey: color,
      taskIsCompletedKey: isCompleted,
      taskReminderKey: remind,
    };
  }
}
