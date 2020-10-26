import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
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
                style: AppThemes.normalTextStyle
                    .copyWith(fontSize: 14, color: AppColors.kDarkGrey)),
          ),
          onTap: () {
            //TODO: Add Navigation to the Comment Section here
            print("User wants to see all the comments");
            ExtendedNavigator.of(context).push(Routes.commentsDetail);
          },
        ),
        SizedBox(
          height: 8.0,
        ),
        UsersCommentsWidget(),
      ],
    );
  }
}

class UsersCommentsWidget extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String comment;
  const UsersCommentsWidget({
    Key key,
    this.avatarUrl = "http://www.gravatar.com/avatar/?d=identicon",
    this.userName = "Cody Doe",
    this.comment = "I would love to try this. Can we connect? 😍😍",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: CustomAvatar(avatarUrl: avatarUrl,radius: 6,),
          ),
          SizedBox(width: 6.0),
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO:Pass real user name via model
                  Text(userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.normalTextStyle
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.normalTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 14))
                ]),
          )
        ],
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key key,
   this.avatarUrl = "http://www.gravatar.com/avatar/?d=identicon", this.radius=10, this.backgroundColor=AppColors.kDarkGrey,
  }) : super(key: key);

  final String avatarUrl;
  final double radius;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      backgroundImage:
          //TODO:Add Real user image
          NetworkImage(avatarUrl),
    );
  }
}

//TODO: NOT USING THIS - CAN BE
class IndividualComments extends StatelessWidget {
  const IndividualComments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          //TODO: This should be picked up from each individual posts
          child: RichText(
            text: TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Text('Afsal Kp', style: AppThemes.postHeadLineUserStyle),
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
    );
  }
}
