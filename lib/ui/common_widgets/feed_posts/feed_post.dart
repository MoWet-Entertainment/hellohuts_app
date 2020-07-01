import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        child: Container(
          color: AppColors.kPureWhite,
          child: Container(
            child: Column(
              children: <Widget>[
                _feedPostTopSection(context, list),
                _feedPostMiddleSection(list),
                _feedPostBottomSection(list),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _feedPostMiddleSection(FeedModel list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AspectRatio(
        aspectRatio: 319.w / 199.h,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
    return Padding(
      padding: EdgeInsets.only(left: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Container(
              constraints: BoxConstraints(maxWidth: 288.w),
              child: Text(model.postTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: AppColors.kDarkTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(model.postedDate),
              Text("|"),
              Text(model.postCategory),
            ],
          )
        ],
      ),
    );
  }

  Widget _postLikeSection() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0, top: 16, bottom: 16),
        child: Container(
          child: Icon(
            HelloIcons.heart,
            size: 24,
            color: AppColors.kDarkGrey,
          ),
        ),
      ),
    );
  }

  Widget _feedPostTopSection(BuildContext context, FeedModel list) {
    return Padding(
      padding: EdgeInsets.only(left: 26.w, right: 16.h, top: 16.w, bottom: 8.h),
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
