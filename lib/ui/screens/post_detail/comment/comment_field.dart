import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/comment/comment_state.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comment_textfield.dart';
import 'package:provider/provider.dart';

class CommentTextFieldWidget extends StatefulWidget {
  const CommentTextFieldWidget({Key key}) : super(key: key);

  @override
  _CommentTextFieldWidgetState createState() => _CommentTextFieldWidgetState();
}

class _CommentTextFieldWidgetState extends State<CommentTextFieldWidget> {
  FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commentState = Provider.of<CommentState>(context);
    return CustomTextFieldWidget(
        hintText: commentState.isReplying
            ? "Replying to " + commentState.replyingTo + " .."
            : "Add Comment",
        isImageSupported: false,
        focusNode: focusNode,
        onSubmitPressed: _onSubmitted);
  }

  void _onSubmitted(String value) {
    final commentState = Provider.of<CommentState>(context, listen: false);
    final authState = Provider.of<AuthState>(context, listen: false);

    bool isReplying = commentState.isReplying;

    Comment comment = Comment(
      postId: commentState.parentPostId ?? "12323",
      comment: value,
      key: "1232323df",
      createdTimeStamp: DateTime.now(),
      updatedTimeStamp: DateTime.now(),
      //TODO: get the user id from the user model
      //TODO: IMPORTANT : need to refactor
      userId: authState.userId ?? "vinoop ks",
      userName: (authState.userModel?.displayName) ?? "Vinoop KS",
      userPhotoUrl: (authState.userModel?.photoUrl) ??
          "http://www.gravatar.com/avatar/?d=identicon",
      parentKey: isReplying ? commentState.getCommentModel().key : null,
    );

    if (isReplying) {
      focusNode.requestFocus();
      commentState.addReplyToComment(commentState.getCommentModel(), comment);
    } else {
      commentState.addToCommentList(comment);
    }
    commentState.setIsReplying = false;
    commentState.resetCommentModel();
    commentState.setReplyingTo("");
  }
}

typedef void TextFieldSubmittedCallback(String value, Comment parentModel);
