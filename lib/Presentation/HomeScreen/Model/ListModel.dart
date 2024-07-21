class ListModel {
  String? title;
  String? body;
  int? postId;
  int? userId;

  ListModel({
    required this.title,
    required this.body,
    required this.postId,
    required this.userId,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      userId: json['userId'],
      postId: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.postId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  String toString() {
    return 'ListModel{userID: $userId, postID: $postId, title: $title, body: $body}';
  }
}
