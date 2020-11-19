import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/comment/comment_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCommentsPlaceholder extends StatelessWidget {
  final FeedModel model;
  final bool isFeedPage;
  const PostCommentsPlaceholder({Key key, this.model, this.isFeedPage = false})
      : super(key: key);

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
          isFeedPage: isFeedPage,
        ),
      ],
    );
  }
}

class UsersCommentsWidget extends StatelessWidget {
  final Comment commentModel;
  final bool showFirstReplyComment;
  final bool isFeedPage;
  const UsersCommentsWidget({
    Key key,
    @required this.commentModel,
    this.showFirstReplyComment = true,
    this.isFeedPage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    final difference = now.difference(commentModel.updatedTimeStamp);
    final theme = Theme.of(context);
    final commentState = Provider.of<CommentState>(context);
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
                      Row(
                        children: [
                          Text(commentModel?.userName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(width: 20),
                          Spacer(),
                          Text(
                            timeago.format(now.subtract(difference),
                                locale: 'en_short'),
                            style: theme.textTheme.bodyText1.copyWith(
                                fontSize: 10, color: AppColors.kbDarkGrey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(commentModel?.comment,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyText1.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      isFeedPage
                          ? SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Text('Reply',
                                            style: theme.textTheme.bodyText1
                                                .copyWith(
                                                    color: AppColors.kbDarkGrey,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        onTap: () => {
                                          //TODO: implement post reply feature here.
                                          
                                          commentState.setCommentModel(commentModel),
                                          commentState.setReplyingTo(commentModel.userName),
                                          commentState.setIsReplying = true,
                                             print( "User wants to reply to the post"),
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      commentModel.childCommentList?.length!=0
                                          ? _CommentBottomSection(
                                              commentModel: commentModel)
                                          : SizedBox.shrink(),
                                      // Spacer(),
                                    ]),
                              ],
                            ),
                      !isFeedPage &&
                              showFirstReplyComment &&
                              commentModel.childCommentList?.length!=0
                          ? _CommentRepliesSection(commentModel: commentModel)
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Container(
    //   width: 20,
    //   height: 20,
    //   color: Colors.blue,
    // ),
  }
}

class _CommentBottomSection extends StatelessWidget {
  const _CommentBottomSection({
    Key key,
    @required this.commentModel,
  }) : super(key: key);

  final Comment commentModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: (Row(
          children: [
            Image.asset(
              HelloIcons.comment_light_icon,
              height: 12,
              color: AppColors.kbDarkGrey,
            ),
            SizedBox(width: 6),
            Text(
              commentModel.childCommentList?.length.toString(),
              style: theme.textTheme.bodyText1
                  .copyWith(fontSize: 12, color: AppColors.kbDarkGrey),
            )
          ],
        )),
      ),
      onTap: () => {
        //TODO: Implement feature to see all the replys to the comment
        print("user wants to see all the replys to the comment"),
      },
    );
  }
}

class _CommentRepliesSection extends StatefulWidget {
  const _CommentRepliesSection({
    Key key,
    @required this.commentModel,
  }) : super(key: key);

  final Comment commentModel;

  @override
  __CommentRepliesSectionState createState() => __CommentRepliesSectionState();
}

class __CommentRepliesSectionState extends State<_CommentRepliesSection> {
  bool _showAllReplies = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 28.0, top: 8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
            height: 32,
            width: 2,
            color: theme.dividerColor,
          ),
        ),
        SizedBox(width: 8),
        _UserCommentWidget(
          commentModel: widget.commentModel,
          showAllReplies: _showAllReplies,
        ),
      ]),
      Container(
        padding: const EdgeInsets.only(top: 8.0),
        child: widget.commentModel.childCommentList.length > 1
            ? GestureDetector(
                child: Text(
                  _showAllReplies ? 'Show less' : 'Show all replies',
                  style: theme.textTheme.bodyText1.copyWith(
                      fontSize: 12, color: AppColors.kbDarkGrey),
                ),
                onTap: () => {
                  //TODO: Implement a way to see all the replies to the specific comment
                  print(
                      "User wants to see all the replies to this comment"),
                  setState(() {
                    _showAllReplies = !_showAllReplies;
                  })
                },
              )
            : SizedBox.shrink(),
      ),
            ]),
    );
  }
}

class _UserCommentWidget extends StatelessWidget {
  final bool showAllReplies;
  const _UserCommentWidget({
    Key key,
    @required this.commentModel,
    this.showAllReplies = true,
  }) : super(key: key);

  final Comment commentModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return showAllReplies
        ? _buildAllReplyComments(theme)
        : Expanded(
            child: _buildSingleReplyComment(
                theme, commentModel.childCommentList[0], context));
  }

  Widget _buildAllReplyComments(ThemeData theme) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: commentModel.childCommentList?.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSingleReplyComment(
              theme, commentModel.childCommentList[index], context);
        },
      ),
    );
  }

  Widget _buildSingleReplyComment(
      ThemeData theme, Comment model, BuildContext context) {
    final now = new DateTime.now();
    final difference = now.difference(model.updatedTimeStamp);
    final commentState = Provider.of<CommentState>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: CustomAvatar(
            avatarUrl: model?.userPhotoUrl,
            radius: 6,
          ),
        ),
        SizedBox(width: 6.0),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(model?.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyText1
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(width: 20),
                ],
              ),
              Text(model?.comment,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 14)),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    GestureDetector(
                      child: Text('Reply',
                          style: theme.textTheme.bodyText1.copyWith(
                              color: AppColors.kbDarkGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      onTap: () => {
                                                commentState.setCommentModel(model),
                                                commentState.setReplyingTo(model.userName),
                        commentState.setIsReplying = true,
                        //TODO: implement post reply feature here.
                        print("User wants to reply to the post"),

                      },
                    ),
                    SizedBox(width: 20),
                    model.childCommentList?.length!=0
                        ? _CommentBottomSection(commentModel: model)
                        : SizedBox.shrink(),
                    // Spacer(),
                  ]),
                  Text(
                    timeago.format(now.subtract(difference),
                        locale: 'en_short'),
                    style: theme.textTheme.bodyText1
                        .copyWith(fontSize: 10, color: AppColors.kbDarkGrey),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ],
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
