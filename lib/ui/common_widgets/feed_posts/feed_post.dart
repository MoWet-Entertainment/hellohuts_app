import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class FeedPost extends StatelessWidget {
  final FeedModel model;
  const FeedPost({Key key, this.model}) : super(key: key);

  @override
  void initState() {
    ScreenUtil.init(width: 375, height: 801);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _feedPosts(context, model),
    );
  }

  Widget _feedPosts(BuildContext context, FeedModel list) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: AppColors.kPureWhite,
        ),
        child: Column(
          children: <Widget>[
            _feedPostTopSection(context, list),
            _feedPostContent(list),
          ],
        ),
      ),
    );
  }

  Widget _feedPostContent(list) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      child: InkWell(
        child: Column(
          children: <Widget>[
            _feedPostMiddleSection(list),
            _feedPostBottomSection(list),
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

  Widget _feedPostBottomSection(FeedModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _postDetailsSection(model),
            _postLikeSection(),
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
                child: Text(model.postTitle,
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
                  Text(model.postedDate, style: AppThemes.postDateAndCategoryStyle),
                  spacer(width: 4.0),
                  Text("|",
                      style: AppThemes.postDateAndCategoryStyle),
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

  Widget _postLikeSection() {
    return Flexible(
      flex: 1,
      child: LimitedBox(
        maxWidth: 80,
        child: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          icon: Icon(
            HelloIcons.heart,
            size: 30,
            color: AppColors.kDarkGrey,
          ),
          onPressed: () {
            print("clicked on like");
          },
        ),
      ),
    );
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
