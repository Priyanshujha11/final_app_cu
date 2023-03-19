class Post {
  final String id;
  final String content;
  final int numLikes;

  Post({required this.id, required this.content, required this.numLikes});
}

class Like {
  final String postID;
  final String userID;

  Like({required this.postID, required this.userID});

  Map<String, dynamic> toMap(Like l) {
    return {'userID': l.userID, 'postID': postID};
  }
}
