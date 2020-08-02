import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class PostCommentsPlaceholder extends StatelessWidget {
  final FeedModel model;
  const PostCommentsPlaceholder({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Container(
            child: Text('See all comments',
                style: AppThemes.postHeadLineStyle.copyWith(
                    fontWeight: FontWeight.w300, color: AppColors.kDarkGrey)),
          ),
          onTap: () {
            //TODO: Add Navigation to the Comment Section here
            print("User wants to see all the comments");
            ExtendedNavigator.of(context).pushNamed(Routes.commentsDetail);
          },
        ),
        SizedBox(
          height: 2.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //TODO: This should be picked up from each individual posts
              child: RichText(
                text: TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Text('Afsal Kp',
                        style: AppThemes.postHeadLineUserStyle),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                      text:
                          'Can\'t wait to build thisNow you can browse privately, and other people who use this device won\'t see your activity. However, downloads and bookmarks will be saved!',
                      style: AppThemes.postHeadLineStyle),
                ]),
              ),
            ),
          ],
        )
      ],
    );
  }
}