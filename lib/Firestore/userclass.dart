class UserA{
  final String? id;
  final String? createDate;
  final String? title;
  final String? text;
  final String? mail;

  UserA({
    this.id,
    this.createDate,
    this.title,
    this.text,
    this.mail
  });

  Map<String, dynamic> toJson() => {
    "id":id,
    "mail":mail,
    "title":title.toString(),
    "text":text.toString(),
    "lastupdated":createDate,
  };

  static UserA fromJson(Map<String, dynamic> json) => UserA(
    id: json["id"],
    mail: json["mail"],
    title: json["title"],
    text: json["text"],
    createDate: json["lastupdated"]
  );
}

