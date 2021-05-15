import 'package:hooks_riverpod/hooks_riverpod.dart';

class JsonConstants {
  JsonConstants._();
  //TRANSACTION SPECIFIC CONSTANTS
  static const String transactionType = 'transaction_type';
  static const String timeStamp = 'time_stamp';
  static const String amount = 'amount';
  static const String transactionStatus = 'transaction_status';
  static const String transactionDetails = 'transaction_details';
  static const String transactionFromaccountNo = 'trasaction_from_account_no';
  static const String transactionToAccountNo = 'trasaction_to_account_no';
  static const String modeOfTransaction = 'mode_of_transaction';
  static const String transaction = "101";
  static const String activity = "102";
  static const String event = "103";
  static const String undefined = "104";
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
  static const String userTitle = 'user_title';
  static const String userCompany = "user_company";
  static const String assignedProjects = "assigned_projects";

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
  static const String paintingMaterialsType =
      "customization_painting_materials";

  //CUSTOMIZATION CONSTANTS
  static const String budgetType = "budget";
  static const String balancedType = "balanced";
  static const String bestType = "best";
  static const String none = "none";
  static const String basic = "basic";
  static const String standard = "standard";
  static const String classic = "classic";
  static const String premium = "premium";

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
  static const String updatedAt = 'updated_at';

  //DashboardItem
  static const String itemType = 'item_type';
  static const String itemText1 = 'item_text1';
  static const String itemText2 = 'item_text2';
  static const String createdBy = 'created_by';
  static const String updatedBy = 'updated_by';
  static const String providedBy = "provided_by";
  static const String itemCategory = 'item_category';

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

  //Project Details
  static const String project_area = "project_area";
  static const String plinth_area = "plinth_area";
  static const String projectDateOfCompletion = "project_date_of_completion";
  static const String projectEstimatedDateOfCompletion =
      "project_est_date_of_completion";
  static const String projectStartDate = "project_start_date";
  static const String projectEstimate = "project_estimate";
  static const String projectTotalPaid = "project_total_paid";
  static const String projectCompletionPercentage = "project_completion_perc";

  static const String projectId = "project_id";
  static const String projectLocation = "project_location";
  static const String clientName = "client_name";

  static const String address = "address";
  static const String address1 = "address1";
  static const String address2 = "address2";
  static const String postalLoc = "postal_loc";
  static const String postalCode = "postal_code";
  static const String district = "district";
  static const String state = "state";
  static const String country = "country";

  static const String projectAddress = "project_address";
  static const String clientAddress = "client_address";

  static const String contractor = "contractor";
  static const String contractorDetails = "contractor_details";
  static const String contractorName = "contractor_name";
  static const String contractorCompany = "contractor_company";
  static const String companyName = "company_name";
  static const String contractorAddress = "contractor_address";
  static const String projectEngineer = "project_engineer";
  static const String engineerDetails = "engineer_details";

  static const String baseRate = "base_rate";

  static const String planCategory = "plan_category";
  static const String selectedPlan = "selected_plan";
  static const String itemMainGroup = "item_main_group";
  static const String subItem = "sub_item";
  static const String imagePresent = "image_present";
  static const String itemHeadline = "item_headline";
  static const String itemImage = "item_image";

  static const String planType = "plan_type";
  static const String planImage = "plan_image";

  static const String uniqueId = "unique_id";

  //Requirements Details
  static const String numberOfStoreys = "number_of_storeys";
  static const String numberOfBedrooms = "number_of_bedrooms";
  static const String numberOfBathrooms = "number_of_bathrooms";
  static const String otherBuildingRequirements = "other_building_requirements";
  static const String buildingRequirements = "building_requirements";
  static const String otherRoomTypes = "other_room_types";

//Building Items Details
  static const String itemName = "item_name";
  static const String contents = "contents";
  static const String buildingMaterials = "building_materials";
  static const String flooring = "flooring";
  static const String plumbing = "plumbing";
  static const String electricals = "electricals";
  static const String doorsAndWindows = "doors_and_windows";
  static const String kitchenDecors = "kitchen_decor";
  static const String interiorDecor = "interior_decor";
  static const String exteriorDecor = "exterior_decor";
  static const String painting = "painting";

  //Documents
  static const String projectDocuments = "project_documents";
  static const String personalDocuments = "personal_documents";
  static const String otherDocuments = "other_documents";
  static const String specificationDocuments = "specification_documents";

  static const String isAvailable = "is_available";
  static const String downloadUrl = "download_url";
  static const String documentReason = "document_reason";

  static const String projectDrawing = "project_drawing";
  static const String warrantyCard = "warranty_card";
  static const String billStatement = "bill_statement";
  static const String projectApproval = "project_approval";
  static const String specification = "specification";
  static const String personalDoc = "personal_doc";

  //file
  static const String fileName = "file_name";
  static const String size = "size";

  //project stages
  static const String currentStage = "current_stage";
  static const String activeStages = "active_stages";
  static const String completedStages = "completed_stages";
  static const String upcomingStages = "upcoming_stages";

  static const String active = "active";
  static const String completed = "completed";
  static const String pending = "pending";
  static const String refused = "refused";
  static const String onHold = "on_hold";
  static const String rejected = "rejected";

  static const String estimatedDate = "estimated_date";
  static const String actualDate = "actual_date";
  static const String date = "date";
  static const String isCompleted = "is_completed";
}
