class Task {
  final int id;
  String? title, task, repeat, date, startTime, endTime;
  int? color, remind;

  Task(
      {required this.id,
      this.title,
      this.task,
      this.repeat,
      this.date,
      this.startTime,
      this.endTime,
      this.color,
      this.remind});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      task: json['task'],
      repeat: json['repeat'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      remind: json['remind'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'task': task,
      'repeat': repeat,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
    };
  }
}