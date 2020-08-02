import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/comments_placeholder.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPostTitleDetails extends StatelessWidget {
  final FeedModel model;
  const FeedPostTitleDetails({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              constraints: BoxConstraints(maxWidth: 333.w),
              child: RichText(
                maxLines: 2,
                text: TextSpan(children: <InlineSpan>[
                  //  TextSpan(text: model.postedUser,style: AppThemes.postHeadLineStyle.copyWith(fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        model.postedUser,
                        style: AppThemes.postHeadLineUserStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: ExpandableText(
                        model.postTitle,
                        expandText: "more",
                        collapseText: '',
                        linkColor: AppColors.kDarkGrey,
                        style: AppThemes.postHeadLineStyle,
                      )),
                ]),
              ),
            ),
          ),
          SizedBox(height: 8.0),

          //TODO:Add a condition for comments present or not here
          //Show the commments text should be based on whether
          //comments are present in the post or not
          PostCommentsPlaceholder(model: model),
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
          ),
        ],
      ),
    );
  }
}


