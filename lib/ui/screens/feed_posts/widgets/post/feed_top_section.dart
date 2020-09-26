import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/board/add_to_board.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeedPostTopSection extends StatelessWidget {
  final FeedModel model;
  const FeedPostTopSection({Key key, this.model }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _feedPostTopSection(context, model);
  }

  Widget _feedPostTopSection(
      BuildContext context, FeedModel list) {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            postedUserSection(context,
                imagePath: list.userAvatar,
                postedUser: list.postedUser,
                userTitle: list.postedUsertitle,
                radiusOfAvatar: 12),
            Spacer(),
            GestureDetector(
              child: const Icon(
                HelloIconsOld.ellipsis_v,
                size: 20.0,
                color: AppColors.kAlmostBlack,
              ),
              onTapDown: (TapDownDetails details) {
                // showPopupMenu(context, model, details.globalPosition);
                openBottonSheet(context, model);
              },
            ),
            // Container(
            //   child: SmoothPageIndicator(
            //     controller: controller,
            //     count: 4,
            //     effect: ExpandingDotsEffect(
            //       expansionFactor: 3
            //     ),
              // ),
            // )
          ],
        ),
      ),
    );
  }
}
