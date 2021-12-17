class Colors {
  int id;
  String title;
  String code;

  Colors({
    required this.id,
    required this.title,
    required this.code,
  });

  Colors.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        code = json['code'];
}
