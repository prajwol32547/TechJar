class commentModel {
  int? userID;
  int? PostID;
  String? name;
  String? email;
  String? body;
  String? comment;

  commentModel(
      {required this.PostID,
      required this.userID,
      required this.name,
      required this.body,
      required this.email});

  factory commentModel.fromJson(Map<String, dynamic> json) {
    return commentModel(
        PostID: json['userId'],
        userID: json['id'],
        name: json['title'],
        body: json['body'],
        email: json['email']);
  }
  @override
  String toString() {
    return 'commentModel{userID: $userID, PostID: $PostID, name: $name, email: $email, body: $body}';
  }
}
