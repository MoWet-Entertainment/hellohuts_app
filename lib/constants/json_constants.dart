class JsonConstants {
  //TRANSACTION SPECIFIC CONSTANTS
  static const String transactionType = 'transaction_type';
  static const String timeStamp = 'time_stamp';
  static const String amount = 'amount';
  static const String transactionStatus = 'transaction_status';
  static const String transactionDetails = 'transaction_details';
  static const String transactionFromaccountNo = 'trasaction_from_account_no';
  static const String transactionToAccountNo = 'trasaction_to_account_no';
  static const String modeOfTransaction = 'mode_of_transaction';

  //USER SPECIFIC CONSTANTS
  static const String userId = 'uid';
  static const String email = 'email';
  static const String displayName = 'display_name';
  static const String phoneNumber = 'phone_number';
  static const String photoUrl = 'photo_url';
  static const String userRole = 'user_role';
  static const String isEmailVerified = 'is_email_verified';
  static const String createdAt = 'created_at';
  static const String profLastUpdatedAt = "prof_last_updated_at";
  static const String lastLoginAt = 'last_login_at';
}

class AppFeedConstants {
  //APP FEED CONSTANTS
  static const String userId = 'uid';
  static const String key = 'post_key';
  static const String postTitle = 'post_title';
  static const String postCreatedAt = 'post_created_at';
  static const String postDescription = "post_description";
  static const String postLikeCount = "post_like_count";
  static const String postCommentCount = "post_comment_count";
  static const String postShareCount = "post_share_count";
  static const String postImagePathList = "post_image_path_list";
  static const String postLikeList = "post_like_list";
  static const String postTags = "post_tags";
  static const String postCommentKeyList = "post_comment_key_list";
  static const String postedUser = "posted_user";
  static const String postParentKey = "post_parent_key";
  static const String postChildKey = "post_child_key";
  static const String postCommentsList = 'post_comment_list';
  static const String userName = "user_name";
  static const String userPhotoUrl = "user_photo_url";
}
