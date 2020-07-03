import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class FeedPost extends StatelessWidget {
  final FeedModel model;
  const FeedPost({Key key, this.model}) : super(key: key);

  @override
  void initState() {
    ScreenUtil.init(width: 375, height: 801);
  }

  @override
  Widget build(BuildContext context) {
    print("content1 rebuit");
    return Container(
      child: _feedPosts(model),
    );
  }

  Widget _feedPosts(FeedModel list) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: AppColors.kPureWhite,
        ),
        child: Column(
          children: <Widget>[
            _FeedPostTopSection(model: list),
            _FeedPostContent(model: list),
          ],
        ),
      ),
    );
  }
}

class _FeedPostTopSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostTopSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _feedPostTopSection(context, model);
  }

  Widget _feedPostTopSection(BuildContext context, FeedModel list) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 8.h),
      child: Row(
        children: <Widget>[
          postedUserSection(context,
              imagePath: list.userAvatar,
              postedUser: list.postedUser,
              userTitle: list.postedUsertitle,
              radiusOfAvatar: 8.w),
          Spacer(),
          Icon(HelloIcons.ellipsis_v),
        ],
      ),
    );
  }
}

class _FeedPostLikeSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostLikeSection({Key key, this.model}) : super(key: key);
  final userId = '1234';

  @override
  Widget build(BuildContext context) {
    print("like section rebuit");
    return _postLikeSection(context, model);
  }

  Widget _postLikeSection(BuildContext context, FeedModel model) {
    var state = Provider.of<FeedState>(context);
    return Flexible(
      flex: 1,
      child: LimitedBox(
        maxWidth: 80,
        child: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          icon: model.userLiked
              ? Icon(
                  HelloIcons.heart_filled,
                  size: 21,
                  color: AppColors.kDarkRed,
                )
              : Icon(
                  HelloIcons.heart,
                  size: 28,
                  color: AppColors.kDarkGrey,
                ),
          onPressed: () {
            state.addLikeToPost(model, userId);
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _postDetailsSection(model),
            _FeedPostLikeSection(
              model: model,
            )
          ],
        ),
      ),
    );
  }

  Widget _postDetailsSection(FeedModel model) {
    return Flexible(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                constraints: BoxConstraints(maxWidth: 333.w),
                child: Text(
                  model.postTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppThemes.postHeadLineStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(model.postedDate,
                      style: AppThemes.postDateAndCategoryStyle),
                  spacer(width: 4.0),
                  Text("|", style: AppThemes.postDateAndCategoryStyle),
                  spacer(width: 4.0),
                  Text(model.postCategory,
                      style: AppThemes.postDateAndCategoryStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FeedPostContent extends StatelessWidget {
  final FeedModel model;
  const _FeedPostContent({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      child: InkWell(
        child: Column(
          children: <Widget>[
            _feedPostMiddleSection(model),
            _FeedPostBottomSection(model: model),
          ],
        ),
        onTap: () => {print("Clicked on the Post")},
      ),
    );
  }

  Container _feedPostMiddleSection(FeedModel list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: AspectRatio(
        aspectRatio: 319.w / 199.h,
        child: Container(
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
    );
  }
}
