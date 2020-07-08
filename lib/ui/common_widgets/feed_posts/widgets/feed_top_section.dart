import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/feed_posts/widgets/feed_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPostTopSection extends StatelessWidget {
  final FeedModel model;
  const FeedPostTopSection({Key key, this.model}) : super(key: key);

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
          GestureDetector(
            child: const Icon(HelloIcons.ellipsis_v),
            onTapDown: (TapDownDetails details) {
              // showPopupMenu(context, model, details.globalPosition);
              openBottonSheet(context, model);
            },
          ),
        ],
      ),
    );
  }
}
