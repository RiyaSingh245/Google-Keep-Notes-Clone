

class NotesImpName {
  static const String id = "id";
  static const String pin = "pin";
  static const String isArchieve = "isArchieve";
  static const String title = "title";
  static const String content = "content";
  static const String createdTime = "createdTime";
  static const String TableName = "notes";
  static const List<String> values = [
    id,
    isArchieve,
    pin,
    title,
    content,
    createdTime
  ];
}

class Note {
  final int? id;
  final bool pin;
  final bool isArchieve;
  final String title;
  final String content;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.pin,
    required this.isArchieve,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? pin,
    bool? isArchieve,
    String? title,
    String? content,
    DateTime? createdTime,
  }) {
    return Note(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      isArchieve: isArchieve ?? this.isArchieve,
      title: title ?? this.title,
      content: content ?? this.content,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  static Note fromJson(Map<String, Object?> json) {
    return Note(
        id: json[NotesImpName.id] as int?,
        pin: json[NotesImpName.pin] == 1,
        isArchieve: json[NotesImpName.isArchieve] == 1,
        title: json[NotesImpName.title] as String,
        content: json[NotesImpName.content] as String,
        createdTime: DateTime.parse(json[NotesImpName.createdTime] as String));
  }

  Map<String, Object?> toJson() {
    return {
      NotesImpName.id: id,
      NotesImpName.pin: pin ? 1 : 0,
      NotesImpName.isArchieve: isArchieve ? 1 : 0,
      NotesImpName.title: title,
      NotesImpName.content: content,
      NotesImpName.createdTime: createdTime.toIso8601String(),
    };
  }
}
