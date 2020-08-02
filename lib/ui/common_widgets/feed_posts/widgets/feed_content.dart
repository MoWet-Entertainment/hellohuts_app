import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hellohuts_app/app.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'feed_like_section.dart';
import 'feed_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class FeedPostContent extends StatelessWidget {
  final FeedModel model;
  const FeedPostContent({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userId = '1234';
    var state = Provider.of<FeedState>(context, listen: false);
    return Column(
      children: <Widget>[
        GestureDetector(
          child: _FeedPostMiddleSection(model: model),
          onDoubleTap: () => state.addLikeToPost(model, userId),
        ),
        _FeedPostBottomSection(model: model),
      ],
    );
  }

  void onTapPost(BuildContext context) {
    var feedState = Provider.of<FeedState>(context, listen: false);
    // feedState.getPostDetailsFromDatabase(model: model);
  }
}

class _FeedPostMiddleSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostMiddleSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _feedPostMiddleSection(model);
  }

  Container _feedPostMiddleSection(FeedModel list) {
    //TODO: Add a method to pick the aspect ratio from JSON
    final bool _customAspectRatio = false;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AspectRatio(
        aspectRatio: _customAspectRatio ? 1 : (319.w / 197.15.w),
        // aspectRatio: 319.w / 197.15.w,
        child: Image.network(
          list.postImage,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FeedPostBottomSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostBottomSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedState>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LikeButton(model: model, state: state),
                SizedBox(
                  width: 10.0,
                ),
                // Container(
                //   child: GestureDetector(
                //     child: Icon(
                //       HelloIcons.comment_alt,
                //       color: AppColors.kAlmostBlack,
                //       size: 20,
                //     ),
                //     onTap: () {
                //       print('User wants to see comments');
                //     },
                //   ),
                // ),
                // SizedBox(
                //   width: 8.0,
                // ),
                CommentButton(),
                SizedBox(
                  width: 10.0,
                ),
                PinnedWidget(),
                SizedBox(
                  width: 10.0,
                ),
                // ViewsCountWidget(),
                Spacer(),

                Container(
                  child: PlusButton(),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 1.0,
              color: AppColors.kMediumGrey,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FeedPostTitleDetails(model: model),
                // FeedPostLikeSection(
                //   model: model,
                // ),
                // FeedPostLikeSection(
                //   model: model,
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        HelloIcons.plus_circle,
        color: AppColors.kAlmostBlack,
        size: 22,
      ),
      onTap: () {
        print('User wants to see comments');
      },
    );
  }
}

class ShareWidget extends StatelessWidget {
  const ShareWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        HelloIcons.navigator,
        size: 21,
        color: AppColors.kAlmostBlack,
      ),
      onTap: () {
        print('User wants to Share');
      },
    );
  }
}

class PinnedWidget extends StatelessWidget {
  const PinnedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIcons.paperclip,
            size: 21,
            color: AppColors.kAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            '30',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      onTap: () {
        print('User wants to pin the post');
      },
    );
  }
}

class ViewsCountWidget extends StatelessWidget {
  const ViewsCountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIcons.eye,
            size: 21,
            color: AppColors.kAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            '2.3K',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
      },
    );
  }
}

class CommentButton extends StatelessWidget {
  final String postId;
  final String commentCount;
  const CommentButton({
    Key key,
    this.postId, this.commentCount ='',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIcons.comment,
            size: 21,
            color: AppColors.kAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            commentCount,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
        ExtendedNavigator.of(context).pushNamed(Routes.commentsDetail);
      },
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key key,
    @required this.model,
    @required this.state,
  }) : super(key: key);

  final FeedModel model;
  final FeedState state;

  @override
  Widget build(BuildContext context) {
    // var controller = useAnimationController(
    //     duration: Duration(milliseconds: 300), lowerBound: 0.9, upperBound: 1);
//TODO: ADD Aimation to give resoponse to the user
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          model.userLiked
              ? const Icon(
                  HelloIcons.thumbs_up,
                  size: 22,
                  color: AppColors.kDarkRed,
                )
              : const Icon(
                  HelloIcons.thumbs_up,
                  size: 22,
                  color: AppColors.kAlmostBlack,
                ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            '1.2K',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      onTap: () {
        state.addLikeToPost(model, '1234');
      },
    );
  }
}
