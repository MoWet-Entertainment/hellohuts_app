import 'package:flutter/foundation.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/app_state.dart';

class CommentState extends AppState {
  List<Comment> _commentList = null;
  bool _isLoading = false;

  Comment _commentModel = null;
  String _parentPostId = null;
  bool _isReplying = false;
  String _replyingToName = null;

  Future<List<Comment>> getCommentList() async {
    if (_commentList == null) {
      return initCommentForPosts(postId: "");
    }
    return _commentList;
  }

  Future<List<Comment>> initCommentForPosts({@required String postId}) async {
    List<Comment> commentList =
        Mock.commentList.map((ele) => Comment.fromJson(ele)).toList();
    _parentPostId = postId;
    _commentList = commentList;
    return Future.delayed(Duration(seconds: 2), () {
      return commentList;
    });
  }

  bool get isLoading => _isLoading;
  set setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Comment getCommentModel() => _commentModel;

  void setCommentModel(Comment model) {
    _commentModel = model;
    notifyListeners();
  }

  void resetCommentModel() {
    _commentModel = null;
    notifyListeners();
  }

  String get parentPostId => _parentPostId;

  set setParentPostId(String parentPostId) {
    _parentPostId = parentPostId;
  }

  void setCommentList(List<Comment> list) {
    _commentList = list;
    notifyListeners();
  }

  void addToCommentList(Comment comment) {
    _commentList.insert(0, comment);
    _commentModel = null;
    notifyListeners();
  }

  void addReplyToComment(Comment commentParent, Comment reply) {
    if (commentParent.childCommentList == null ||
        commentParent.childCommentList?.length == 0) {
      commentParent = commentParent.copyWith(childCommentList: []);
      print(commentParent);
      commentParent.childCommentList.add(reply);
      // commentParent.copyWith(childCommentList: [reply]);
    } else {
      commentParent.childCommentList.insert(0, reply);
    }
    notifyListeners();
    _isReplying = false;
    _commentModel = null;
  }

  void getCommentsForPost({@required String postId}) {
    //TODO: Include database operations here for getting the commens based on post id

    List<Comment> commentList =
        Mock.commentList.map((ele) => Comment.fromJson(ele)).toList();
    _parentPostId = postId;
    _commentList = commentList;
  }

  bool get isReplying => _isReplying;

  set setIsReplying(bool value) {
    _isReplying = value;
    notifyListeners();
  }

  void resetReplyingTo() {
    _replyingToName = "";
    notifyListeners();
  }

  void setReplyingTo(String name) {
    _replyingToName = name.split(" ").elementAt(0);
    notifyListeners();
  }

  void resetReplySection() {
    setIsReplying = false;
    resetReplyingTo();
    resetCommentModel();
  }

  String get replyingTo => _replyingToName;

  void cleanSessionCommentData() {
    _commentList = null;
    _isLoading = false;
    _parentPostId = null;
    _isReplying = false;
    _replyingToName = null;
  }
}
