import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hellohuts_app/app.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post_detail.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/feed_comment.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/pinned_post/pinned_post.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import '../likes/feed_like_section.dart';
import 'feed_content_title.dart';
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
          onTap: () => {
            ExtendedNavigator.of(context).push(Routes.postDetailScreen,arguments: PostDetailScreenArguments(model: model,))
          },
        ),
        _FeedPostBottomSection(model: model),
      ],
    );
  }

  void onTapPost(BuildContext context) {
    var feedState = Provider.of<FeedState>(context, listen: false);
    print("user tapped on post");
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

  Widget _feedPostMiddleSection(FeedModel list) {
    //TODO: Add a method to pick the aspect ratio from JSON
    final bool _customAspectRatio = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
        
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: AspectRatio(
            aspectRatio: _customAspectRatio ? 1 : (327.w / 243.w),
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
                CommentButton(),
                SizedBox(
                  width: 10.0,
                ),
                // PinnedWidget(),
                ShareWidget(),
                SizedBox(
                  width: 10.0,
                ),
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
        HelloIconsOld.plus_circle,
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
        HelloIconsOld.share_alt,
        size: 21,
        color: AppColors.kAlmostBlack,
      ),
      onTap: () {
        print('User wants to Share');
      },
    );
  }
}




