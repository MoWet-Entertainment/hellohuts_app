import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/comment/comment_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        commentState.isReplying
            ? Container(
                color: Theme.of(context).colorScheme.surface,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Replying to ' + commentState.replyingTo + " ..",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    IconButton(
                        icon: Icon(Icons.close,
                            size: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.6)),
                        onPressed: () {
                          commentState.resetReplySection();
                        }),
                  ],
                ),
              )
            : SizedBox.shrink(),
        CustomTextFieldWidget(
            hintText:
              "Add Comment",
            isImageSupported: false,
            focusNode: focusNode,
            onSubmitPressed: _onSubmitted),
      ],
    );
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
        displayName: (authState.userModel?.displayName) ?? "Vinoop KS",
        userPhotoUrl: (authState.userModel?.photoUrl) ??
            "http://www.gravatar.com/avatar/?d=identicon",
        parentKey: isReplying? commentState.getCommentModel().key : null,
        childCommentList: []);

    if (isReplying) {
      print("isReplying: true");
    
        commentState.addReplyToComment(comment);
   
    } else {
      commentState.addToCommentList(comment);
    }
    commentState.setIsReplying = false;
    commentState.resetCommentModel();
    commentState.setReplyingTo("");
  }
}

typedef void TextFieldSubmittedCallback(String value, Comment parentModel);
