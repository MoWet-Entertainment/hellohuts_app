import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPostTitleDetails extends StatelessWidget {
  final FeedModel model;
  const FeedPostTitleDetails({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
