import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';
import 'feed_like_section.dart';
import 'feed_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPostContent extends StatelessWidget {
  final FeedModel model;
  const FeedPostContent({Key key, this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     var userId = '1234';
  var state = Provider.of<FeedState>(context,listen:  false);
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
      child: InkWell(
        child: Column(
          children: <Widget>[
            _FeedPostMiddleSection(model: model),
            _FeedPostBottomSection(model: model),
          ],
        ),
        onDoubleTap: ()=> state.addLikeToPost(model, userId),
        onTap: ()=> print("user clicked on  the post"),

      ),
    );
  }

  void onTapPost(BuildContext context) {
    var feedState = Provider.of<FeedState>(context, listen: false);
    // feedState.getPostDetailsFromDatabase(model: model);
  }
}

class _FeedPostMiddleSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostMiddleSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _feedPostMiddleSection(model);
  }

  Container _feedPostMiddleSection(FeedModel list) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AspectRatio(
        aspectRatio: 319.w / 199.h,
        child:  Image.network(
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
    );
  }
}



Container _feedPostMiddleSectionBackup(FeedModel list) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 0),
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

class _FeedPostBottomSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostBottomSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FeedPostTitleDetails(model: model),
            FeedPostLikeSection(
              model: model,
            )
          ],
        ),
      ),
    );
  }
}
