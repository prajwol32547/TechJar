class commentModel {
  int? userID;
  int? PostID;
  String? name;
  String? email;
  String? body;
  String? comment;

  commentModel({
    required this.PostID,
    required this.userID,
    required this.name,
    required this.body,
    required this.email,
    this.comment,
  });

  factory commentModel.fromJson(Map<String, dynamic> json) {
    return commentModel(
      PostID: json['postId'],
      userID: json['id'],
      name: json['name'],
      body: json['body'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.PostID;
    data['id'] = this.userID;
    data['name'] = this.name;
    data['body'] = this.body;
    data['email'] = this.email;

    if (this.comment != null) {
      data['comment'] = this.comment;
    }
    return data;
  }

  @override
  String toString() {
    return 'commentModel{userID: $userID, PostID: $PostID, name: $name, email: $email, body: $body}';
  }
}
