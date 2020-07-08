class FeedModel {
  String postTitle;
  String postDesc;
  String postImage;
  String postedUser;
  String postedUsertitle;
  String postedDate;
  String postCategory;
  String userAvatar;
  bool userLiked;

  FeedModel(
      {this.postTitle,
      this.postDesc,
      this.postImage,
      this.postedUser,
      this.postedUsertitle,
      this.postedDate,
      this.postCategory,
      this.userAvatar});

  FeedModel.fromJson(Map<String, dynamic> map) {
    postTitle = map["post_title"];
    postDesc = map["post_description"];
    postImage = map["post_image"];
    postedUser = map["posted_user"];
    postedUsertitle = map["posted_user_title"];
    postedDate = map["posted_date"];
    postCategory = map["post_category"];
    userAvatar = map["user_avatar"];
    userLiked = map["user_liked"];
  }
  toJson() {
    return {
      "post_title": this.postTitle,
      "post_description": this.postDesc,
      "post_image": this.postImage,
      "poster_user": this.postedUser,
      "posted_user_title": this.postedUsertitle,
      "posted_date": this.postedDate,
      "post_category": this.postCategory,
      "user_avatar": this.userAvatar,
      "user_liked": this.userLiked,
    };
  }

  @override
  String toString() {
    return '{FeedModel{post_title: $postTitle, post_description: $postDesc, post_image: $postImage, poster_user: $postedUser}';
  }
}
