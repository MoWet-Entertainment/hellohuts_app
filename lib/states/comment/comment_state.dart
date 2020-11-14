import 'package:flutter/foundation.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/app_state.dart';

class CommentState extends AppState {
  List<Comment> _commentList;
  bool _isLoading = false;

  Comment _commentModel;
  Comment _parentModel;
  List<Comment> getCommentList() {
    if (_commentList != null) {
      return _commentList;
    } else {
      getCommentsForPost(postId: "");
    }
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

  Comment get getParenetModel => _parentModel;

  set setParentModel(Comment model) {
    _parentModel = model;
    notifyListeners();
  }

  void resetParentModel() {
    _parentModel = null;
    notifyListeners();
  }

  void setCommentList(List<Comment> list) {
    _commentList = list;
    notifyListeners();
  }

  void addToCommentList(Comment comment) {
    _commentList.add(comment);
    notifyListeners();
  }

  void getCommentsForPost({@required String postId}) {
    //TODO: Include database operations here for getting the commens based on post id

    List<Comment> commentList =
        Mock.commentList.map((ele) => Comment.fromJson(ele)).toList();
    setCommentList(commentList);
  }

  bool _isReplying = false;
  bool get isReplying => _isReplying;

  set setIsReplying(bool value) {
    _isReplying = value;
    notifyListeners();
  }

  String _replyingToName = "";

  void resetReplyingTo() {
    _replyingToName = "";
    notifyListeners();
  }

  void setReplyingTo(String name) {
    _replyingToName = name;
    notifyListeners();
  }

  String get replyingTo => _replyingToName;
}
