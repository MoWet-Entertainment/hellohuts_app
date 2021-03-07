import 'dart:math' as math;
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/comment/comment_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_style_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comments_placeholder.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import 'package:hellohuts_app/ui/screens/post_detail/comment/comment_field.dart';
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
import 'package:share/share.dart';
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
    final bool _customAspectRatio = true;
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
                aspectRatio: _customAspectRatio ? 0.9 : (327.w / 243.w),
              ),
              itemBuilder: (BuildContext context, int itemIndex,_) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // child: Image.network(
                  //   imageListTemp[itemIndex],
                  //   fit: BoxFit.cover,
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         value: loadingProgress.expectedTotalBytes != null
                  //             ? loadingProgress.cumulativeBytesLoaded /
                  //                 loadingProgress.expectedTotalBytes
                  //             : null,
                  //       ),
                  //     );
                  //   },
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: imageListTemp[itemIndex],
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                LikeButton(
                  isLiked: model.userLiked,
                  assetLocation: HelloIcons.heart_light_icon,
                  onLikedCallback: () => state.addLikeToPost(model, '1234'),
                  defaultBackgroundColor:
                      Theme.of(context).colorScheme.secondaryVariant,
                  defaultIconColor: Theme.of(context).accentIconTheme.color,
                  defaultTextColor: Theme.of(context).accentIconTheme.color,
                ),
                SizedBox(
                  width: 12.0,
                ),
                CommentButton(
                    color: Theme.of(context).accentIconTheme.color,
                    onTap: () {
                      // ExtendedNavigator.root.push(Routes.commentsDetail),
                      if (GetPlatform.isAndroid ||
                          GetPlatform.isIOS ||
                          GetPlatform.isMobile) {
                        print("platform is mobile");
                        changeStatusColor(Colors.transparent);
                      }
                      Get.bottomSheet(
                        _PostCommentListView(),
      backgroundColor: Colors.transparent,
                          isScrollControlled: true,).whenComplete(() =>changeStatusColor(Theme.of(context).colorScheme.background));
                    }),
                SizedBox(
                  width: 12.0,
                ),
                // PinnedWidget(),
                ShareWidget(
                  color: Theme.of(context).accentIconTheme.color,
                  onTap: ()=>Share.share('Great picture')

                  
                ),
                SizedBox(
                  width: 10.0,
                ),
                Spacer(),
                PlusButton(
                  defaultBackgroundColor:
                      Theme.of(context).colorScheme.secondaryVariant,
                  addedToBoardBackGroundColor:
                      Theme.of(context).colorScheme.secondaryVariant,
                  postId: '',
                  onTap: () => {
                    print('User wants to add the post to the saved boards'),
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            // Container(
            //   height: 1.0,
            //   color: AppColors.kMediumGrey,
            // ),
            SizedBox(
              height: 4.0,
            ),
            Row(
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

class _PostCommentListView extends StatefulWidget {
  const _PostCommentListView({
    Key key,
  }) : super(key: key);

  @override
  __PostCommentListViewState createState() => __PostCommentListViewState();
}

class __PostCommentListViewState extends State<_PostCommentListView> {
  Future<List<Comment>> _commentList;
  @override
  void initState() {
    // TODO: implement initState
    //lauch all db related calls here
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final commentState = Provider.of<CommentState>(context, listen: false);
    _commentList = commentState.getCommentList();
    final double height = fullHeight(context);
    final theme = Theme.of(context);
    return Container(
      height: height * 0.8,
      // padding:
      //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: theme.colorScheme.surface,
              ),
              child: ScrollConfiguration(
                behavior: NeatScrollBehavior(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 70.0),
                  child: FutureBuilder(
                    future: _commentList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: UsersCommentsWidget(
                                commentModel: snapshot.data[index],
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            CommentTextFieldWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: fullWidth(context) * .15,
                  height: 5,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  final String postId;
  final bool addedToBoard;
  final VoidCallback onTap;
  final Color defaultBackgroundColor;
  final Color addedToBoardColor;
  final Color defaultIconColor;
  final Color addedToBoardBackGroundColor;
  final double iconSize;
  PlusButton({
    Key key,
    @required this.postId,
    this.addedToBoard = false,
    this.onTap,
    this.defaultBackgroundColor = AppColors.kbAliceBlue,
    this.addedToBoardColor = AppColors.kbAccentColor,
    this.defaultIconColor,
    this.addedToBoardBackGroundColor = AppColors.kbAliceBlue,
    this.iconSize = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: addedToBoard
                ? addedToBoardBackGroundColor
                : defaultBackgroundColor,
          ),
          //TODO: Change userLiked to userBookMarked or not
          child: addedToBoard
              ? Image.asset(
                  HelloIcons.bookmark_bold_icon,
                  color: addedToBoardColor,
                  height: 24.0,
                )
              : Image.asset(
                  HelloIcons.bookmark_light_icon,
                  color: defaultIconColor ??
                      Theme.of(context).accentIconTheme.color,
                  height: 24.0,
                )),
      onTap: onTap,
    );
  }
}

class ShareWidget extends StatelessWidget {
  final Color color;
  final double size;
    final VoidCallback onTap;

  const ShareWidget({
    Key key,
    this.color,
    this.size = 24, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        HelloIcons.share_bold_icon,
        color: color ?? AppColors.kbDarkestGrey,
        height: size,
      ),
      onTap: onTap
    );
  }
}
