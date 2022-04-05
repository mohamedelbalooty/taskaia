class Memory {
  final int id;
  final String title, memory, dateTime;

  Memory({
    required this.id,
    required this.title,
    required this.memory,
    required this.dateTime,
  });

  factory Memory.fromJson(Map<String, dynamic> json){
    return Memory(
      id: json['id'],
      title: json['title'],
      memory: json['memory'],
      dateTime: json['dateTime'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'memory': memory,
      'dateTime': dateTime
    };
  }
}
