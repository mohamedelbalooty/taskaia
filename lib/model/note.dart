class Note {
  final int id, color;
  final String note, dateTime;
  String? image;

  Note(
      {required this.id,
      required this.note,
      required this.dateTime,
      required this.color,
      this.image});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      note: json['note'],
      dateTime: json['dateTime'],
      color: json['color'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'dateTime': dateTime,
      'color': color,
      'image': image,
    };
  }
}
