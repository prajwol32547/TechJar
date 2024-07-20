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

  @override
  String toString() {
    return 'ListModel{userID: $userId, postID: $postId, title: $title, body: $body}';
  }
}
