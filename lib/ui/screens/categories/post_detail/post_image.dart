import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/feed_comment.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostImage extends StatefulWidget {
  const PostImage({Key key, this.imageData}) : super(key: key);
  final ImageData imageData;

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> with TickerProviderStateMixin {
  int _activeIndex = 0;
  int animationSeconds = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeedState>(context);
    bool isCarousel = widget.imageData.imageUrlList.length > 1 ? true : false;
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ]).createShader(rect);
                    },
                    blendMode: BlendMode.darken,
                    child: widget.imageData.imageUrlList.length > 1
                        ? CarouselSlider.builder(
                            itemCount: widget.imageData.imageUrlList.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 4),
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: fullHeight(context) * 0.8,
                              // aspectRatio: 0.7,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _activeIndex = index;
                                });
                                // feedState.updatePostActivePage(model, index);
                              },
                            ),
                            itemBuilder:
                                (BuildContext context, int itemIndex) =>
                                    Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: TweenAnimationBuilder(
                                  curve: Curves.linear,
                                  duration: Duration(seconds: animationSeconds),
                                  tween: Tween<double>(begin: 1, end: 1.06),
                                  builder: (context, double scale, child) {
                                    return Transform.scale(
                                      scale: scale,
                                      child: child,
                                    );
                                  },
                                  child: Image.network(
                                    widget.imageData.imageUrlList[itemIndex],
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              widget.imageData.imageUrlList[0],
                              fit: BoxFit.cover,
                              height: fullHeight(context) * 0.8,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      // height: 100,
                      width: fullWidth(context),
                      child: Row(
                        children: [
                          LikeButton(
                            isLiked: true,
                            likeCount: '918',
                            fontSize: 12,
                            sizeOfIcon: 24,
                            defaultIconColor: AppColors.kbPureWhite,
                            defaultTextColor: AppColors.kbPureWhite,
                            likedBackgroundColor:
                                AppColors.kbDarkRed.withOpacity(0.8),
                            defaultBackgroundColor:
                                AppColors.kbDarkGrey.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          CommentButton(
                            color: AppColors.kbPureWhite,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ShareWidget(
                            color: AppColors.kbPureWhite,
                          ),
                          Spacer(),
                          PlusButton(
                            postId: '',
                            addedToBoard: false,
                            defaultIconColor: AppColors.kbPureWhite,
                            addedToBoardBackGroundColor: Colors.transparent,
                            addedToBoardColor: AppColors.kbAccentColor,
                            defaultBackgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.0),
            isCarousel
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8.0),
                      child: AnimatedSmoothIndicator(
                        count: widget.imageData.imageUrlList.length,
                        activeIndex: _activeIndex,
                        effect: ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 12,
                            spacing: 4,
                            dotColor: AppColors.kbDarkGrey,
                            activeDotColor: AppColors.kbMediumGrey,
                            expansionFactor: 2),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}
