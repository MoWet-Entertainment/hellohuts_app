import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCommentsPlaceholder extends StatelessWidget {
  final FeedModel model;
  const PostCommentsPlaceholder({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Container(
            child: Text('See all comments',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 14, color: AppColors.kbDarkGrey)),
          ),
          onTap: () {
            //TODO: Add Navigation to the Comment Section here
            print("User wants to see all the comments");
            ExtendedNavigator.of(context).push(Routes.commentsDetail);
          },
        ),
        SizedBox(
          height: 8.0,
        ),
        UsersCommentsWidget(
          commentModel: Comment.fromJson(Mock.commentList[0]),
        ),
      ],
    );
  }
}

class UsersCommentsWidget extends StatelessWidget {
  final Comment commentModel;
  final bool showFirstReplyComment;
  const UsersCommentsWidget({
    Key key,
    @required this.commentModel, this.showFirstReplyComment = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    final difference = now.difference(commentModel.updatedTimeStamp);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: CustomAvatar(
                    avatarUrl: commentModel?.userPhotoUrl,
                    radius: 6,
                  ),
                ),
                SizedBox(width: 6.0),
                Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO:Pass real user name via model
                        Row(
                          children: [
                            Text(commentModel?.userName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyText1.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            SizedBox(width: 20),
                          ],
                        ),

                        Text(commentModel?.comment,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 14)),
                        SizedBox(
                          height: 8,
                        ),
                     
                        Row(children: [
                          GestureDetector(
                            child: Text('Reply',
                                style: theme.textTheme.bodyText1
                                    .copyWith(fontSize: 10)),
                            onTap: () => {
                              //TODO: implement post reply feature here.
                              print("User wants to reply to the post"),
                            },
                          ),
                          SizedBox(width: 16),
                          commentModel.childCommentList != null
                              ? GestureDetector(
                                  child: (Row(
                                    children: [
                                      Image.asset(
                                        HelloIcons.comment_bold_icon,
                                        height: 12,
                                        color: AppColors.kbDarkGrey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        commentModel.childCommentList.length
                                            .toString(),
                                        style: theme.textTheme.bodyText1
                                            .copyWith(fontSize: 10),
                                      )
                                    ],
                                  )),
                                  onTap: () => {
                                    //TODO: Implement feature to see all the replys to the comment
                                    print(
                                        "user wants to see all the replys to the comment"),
                                  },
                                )
                              : SizedBox.shrink(),
                          Spacer(),
                          Text(
                            timeago.format(now.subtract(difference),
                                locale: 'en_short'),
                            style: theme.textTheme.bodyText1
                                .copyWith(fontSize: 10),
                          ),
                        ]),
                        SizedBox(height:8),
                           showFirstReplyComment && commentModel.childCommentList!=null? Container(width:20, height:20, color:Colors.blue):SizedBox.shrink(),
                      ]),
                ),
              ],
            ),
          ),
          // Container(
          //   width: 20,
          //   height: 20,
          //   color: Colors.blue,
          // ),
        ],
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key key,
    this.avatarUrl = "http://www.gravatar.com/avatar/?d=identicon",
    this.radius = 10,
    this.backgroundColor = AppColors.kbDarkGrey,
  }) : super(key: key);

  final String avatarUrl;
  final double radius;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      backgroundImage:
          //TODO:Add Real user image
          NetworkImage(avatarUrl),
    );
  }
}

//TODO: NOT USING THIS - CAN BE
class IndividualComments extends StatelessWidget {
  const IndividualComments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          //TODO: This should be picked up from each individual posts
          child: RichText(
            text: TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Text('Afsal Kp', style: AppThemes.postHeadLineUserStyle),
              ),
              TextSpan(text: ' '),
              TextSpan(
                  text:
                      'Can\'t wait to build thisNow you can browse privately, and other people who use this device won\'t see your activity. However, downloads and bookmarks will be saved!',
                  style: AppThemes.postHeadLineStyle),
            ]),
          ),
        ),
      ],
    );
  }
}
