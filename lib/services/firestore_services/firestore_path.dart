class FirestorePath {
  static String projects(String uid) => 'users/$uid/projects';
  static String users = 'users';
  static String project(String uid, String projectId) =>
      'users/$uid/projects/$projectId';
  static String transcations(String uid, String projectId) =>
      'users/$uid/projects/$projectId/transactions';
  static String transcation(String uid, String projectId, String entryId) =>
      'users/$uid/projects/$projectId/transactions/$entryId';
  static String posts = 'posts'; 
}
