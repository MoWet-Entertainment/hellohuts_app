import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/feed_posts/widgets/feed_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class FeedPostTopSection extends StatelessWidget {
  final FeedModel model;
  const FeedPostTopSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _feedPostTopSection(context, model);
  }

  Widget _feedPostTopSection(BuildContext context, FeedModel list) {
    return Container(
      height: 40 ,
          child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 8),
        child: Row(
        
          crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
            postedUserSection(context,
                imagePath: list.userAvatar,
                postedUser: list.postedUser,
                userTitle: list.postedUsertitle,
                radiusOfAvatar: 10),
            Spacer(),
            GestureDetector(
              child: const Icon(HelloIcons.ellipsis_v,size: 20.0,color: AppColors.kAlmostBlack,),
              onTapDown: (TapDownDetails details) {
                // showPopupMenu(context, model, details.globalPosition);
                openBottonSheet(context, model);
              },
            ),
          ],
        ),
      ),
    );
  }
}
