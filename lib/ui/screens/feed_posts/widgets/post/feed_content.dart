import 'dart:math' as math;
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/app.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post_detail.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/feed_comment.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/pinned_post/pinned_post.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../likes/feed_like_section.dart';
import 'feed_content_title.dart';

class FeedPostContent extends StatelessWidget {
  final FeedModel model;
  final PageController controller;
  const FeedPostContent({Key key, this.model, this.controller})
      : super(key: key);

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
            ExtendedNavigator.of(context).push(Routes.postDetailScreen,
                arguments: PostDetailScreenArguments(
                  model: model,
                ))
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
  _FeedPostMiddleSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Add a method to pick the aspect ratio from JSON
    final feedState = Provider.of<FeedState>(context);
    final bool _customAspectRatio = false;
    List<String> imageListTemp = [
      "https://images.unsplash.com/photo-1575379047099-155c957f7bab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1564078516393-cf04bd966897?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
      "https://images.unsplash.com/photo-1565031491910-e57fac031c41?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1558882224-dda166733046?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: CarouselSlider.builder(
              
              itemCount: imageListTemp.length,
              options: CarouselOptions(
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                pageViewKey: PageStorageKey("value+${model.postedUser}"),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  print('Current Page: ${index.toString()}');
                  feedState.updatePostActivePage(model, index);
                },
                aspectRatio: _customAspectRatio ? 1 : (327.w / 243.w),
              ),
              itemBuilder: (BuildContext context, int itemIndex) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    imageListTemp[itemIndex],
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
          ),
        ],
      ),
    );
  }
}

Widget _feedPostMiddleSection(FeedModel list) {}

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
                  width: 12.0,
                ),
                CommentButton(),
                SizedBox(
                  width: 12.0,
                ),
                // PinnedWidget(),
                ShareWidget(),
                SizedBox(
                  width: 10.0,
                ),
                Spacer(),
                PlusButton(
                  model: model,
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
  FeedModel model;
  PlusButton({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.kAliceBlue,
          ),
          //TODO: Change userLiked to userBookMarked or not
          child: model.userLiked
              ? Image.asset(
                  HelloIcons.bookmark_bold_icon,
                  color: AppColors.kAccentColor,
                  height: 22.0,
                )
              : Image.asset(
                  HelloIcons.bookmark_light_icon,
                  color: AppColors.kDarkestGrey,
                  height: 22.0,
                )),
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
      child: Image.asset(
        HelloIcons.share_bold_icon,
        color: AppColors.kDarkestGrey,
        height: 22,
      ),
      onTap: () {
        print('User wants to Share');
      },
    );
  }
}