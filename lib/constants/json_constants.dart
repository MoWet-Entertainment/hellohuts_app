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
  static const String userName = "user_name";
  static const String phoneNumber = 'phone_number';
  static const String userPhotoUrl = "user_photo_url";
  static const String userRole = 'user_role';
  static const String isEmailVerified = 'is_email_verified';
  static const String profLastUpdatedAt = "prof_last_updated_at";
  static const String lastLoginAt = 'last_login_at';

  //COST ESTIMATION TYPES
  static const String buildingMaterialsType =
      "customization_building_materials";
  static const String flooringType = "customization_flooring";
  static const String electricalsType = "customization_electricals";
  static const String plumbingType = "customization_plumbing";
  static const String doorsAndWindowsType = "customization_doors_and_windows";
  static const String kitchenDecorType = "customization_kitchen_decor";
  static const String exteriorDecorType = "customization_exterior_decor";
  static const String interiorDecorType = "customization_interior_decor";

  //CUSTOMIZATION CONSTANTS
  static const String budgetType = "budget";
  static const String balancedType = "balanced";
  static const String bestType = "best";
  static const String none = "none";
  static const String basic = "basic";
  static const String standard = "standard";
  static const String classic = "classic";

  //APP FEED CONSTANTS
  static const String key = 'key';
  static const String postId = 'post_id';
  static const String postTitle = 'post_title';
  static const String postDescription = "post_description";
  static const String postLikeCount = "post_like_count";
  static const String postCommentCount = "post_comment_count";
  static const String postShareCount = "post_share_count";
  static const String postImagePathList = "post_image_path_list";
  static const String postLikeList = "post_like_list";
  static const String postTags = "post_tags";
  static const String postCommentKeyList = "post_comment_key_list";
  static const String postedUser = "posted_user";

  static const String postCommentsList = 'post_comment_list';

  //Comment
  static const String comment = 'comment';

  //Time stamp
  static const String createdAt = 'created_at';
  static const String updated_at = 'updated_at';

  //DashboardItem
  static const String itemType = 'item_type';
  static const String itemText1 = 'item_text1';
  static const String itemText2 = 'item_text2';
  static const String createdBy = 'created_by';
  static const String updatedBy = 'updated_by';
  static const String providedBy = "provided_by";

  static const String trasactionRecieved = "transaction_received";
  static const String transactionSpent = "transaction_spent";
  static const String starCoinsRecieved = "starcoins_received";
  static const String starCoinsSpent = "starcoins_spent";
  static const String itemDelivered = "item_delivered";
  static const String serviceDebit = "service_debit";
  static const String payementReminder = "payment_reminder";

  //Generic
  static const String parentKey = "parent_key";
  static const String childKey = "child_key";
  static const String childKeyList = 'child_key_list';
  static const String childList = 'child_list';
  static const String isParent = 'is_parent';
}
