class Post {
  int id;
  String? name;
  String? userName;
  String? userPhoto;
  DateTime? dateTime;
  String? text;
  List? photo;
  String? video;
  String? commentCount;
  String? retweetCount;
  String? likeCount;

  Post(
      {required this.id,
      this.name,
      this.userName,
      this.userPhoto,
      this.dateTime,
      this.text,
      this.photo,
      this.video,
      this.commentCount,
      this.retweetCount,
      this.likeCount});
}
