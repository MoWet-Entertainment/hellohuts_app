import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/user_feed/comments.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class PostCommentsDetail extends StatelessWidget {
  const PostCommentsDetail({Key key, this.model, this.commentsParentPostId})
      : super(key: key);
  final String commentsParentPostId;
  final Comment model;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 8.0,
            backgroundColor: AppColors.kPureWhite,
            elevation: 1,

            leading: BackButton(
              color: AppColors.kDarkGrey,
              onPressed: () {
                FocusScope.of(context).unfocus();
                ExtendedNavigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: Text(
              'Comments',
              style: AppThemes.appBarDefaultText,
            ),
            // actions: _getActionButtons(context),
            actions: <Widget>[
              // Align(
              //   alignment: Alignment.center,
              //   child: GestureDetector(
              //     onTap: () {
              //       FocusScope.of(context).unfocus();
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.only(
              //           right: 16.0, top: 4.0, bottom: 4.0),
              //       child: Text('Cancel',
              //           style: AppThemes.postedAuthorTextSubHeadStyle.copyWith(
              //               color: AppColors.kDarkGrey, fontSize: 12.0)),
              //     ),
              //   ),
              // )
            ],
            bottom: PreferredSize(
              child: Container(
                color: Colors.grey.shade200,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(0.0),
            ),
          ),
          body: _CommentsDetails(),
        ),
      ),
    );
  }
}

class _CommentsDetails extends StatelessWidget {
  const _CommentsDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(
      //   child: Text('COmments'),
      // ),
    //   child:CachedNetworkImage(
    
    //   //  placeholder: (context, url) => Container(child: CircularProgressIndicator()),

    //     imageUrl: "http://via.placeholder.com/350x150",
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //  ),
    child: Image.network('http://via.placeholder.com/350x150'),
    );
  }
}
