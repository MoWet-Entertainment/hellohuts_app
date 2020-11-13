import 'package:auto_route/auto_route.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comment_textfield.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/follow_button.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/screens/categories/widgets/wigets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comments_placeholder.dart';
import 'package:hellohuts_app/ui/screens/post_detail/post_image.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';

class PostDetailPage extends StatefulWidget {
  final ImageData imageData;

  PostDetailPage({Key key, @required this.imageData}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    // final itemIndex = imageList.indexOf(imageData);
    // print("index is " + itemIndex.toString());

    return Scaffold(body: _scrollBody(context));
  }

  Widget _scrollBody(BuildContext context) {
    double heightOfAppBar;

    heightOfAppBar = fullHeight(context) * 0.7;
    final theme = Theme.of(context);
    print('Height of AppBar ' + heightOfAppBar.toString());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: NeatScrollBehavior(),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.kDark_1,
                    elevation: 0,
                    leading: Container(
                      decoration: BoxDecoration(
                          // color: Colors.black.withOpacity(0.1),
                          gradient:
                              RadialGradient(center: Alignment.center, colors: [
                            AppColors.kDark_1.withOpacity(0.1),
                            Colors.transparent,
                          ]),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => ExtendedNavigator.of(context).pop()),
                    ),
//               actions: [
// IconButton(icon: Icon(Icons.more_horiz, color: AppColors.kPureWhite,), onPressed: null)
//                ],
                    floating: false,
                    pinned: true,
                    expandedHeight: heightOfAppBar,
                    flexibleSpace: DecoratedBox(
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   colors: <Color>[
                          //     AppColors.kPrimaryYellow,
                          //     AppColors.kPrimaryYellow,
                          //   ],
                          // ),
                          color: AppColors.kDark_1),
                      child: FlexibleSpaceBar(
                        stretchModes: [StretchMode.zoomBackground],
                        collapseMode: CollapseMode.pin,
                        background: PostImage(
                          imageData: widget.imageData,
                        ),
                      ),
                    ),
                  ),
                  _PostDetailTitleHeaders(),
                  _PostDetailContent(),
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: 2,
                  )),
                  NormalGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostDetailCommentPlaceholder extends StatelessWidget {
  const _PostDetailCommentPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.kDark_1,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            child: Container(
                width: fullWidth(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: AppColors.kDark_9,
                ),
                child: Row(
                  children: [
                    //TODO:Add UserImage to avatar, instead of the placeholder
                    CustomAvatar(radius: 10),
                    SizedBox(width: 12),
                    Text(
                      'Add Comment',
                      style: theme.textTheme.bodyText2
                          .copyWith(color: AppColors.kbDarkGrey, fontSize: 12),
                    ),
                    Spacer(),
                    Image.asset(
                      HelloIcons.send_bold_icon,
                      height: 22,
                      color: AppColors.kbDarkGrey,
                    ),
                  ],
                )),
            onTap: () => {
                  _buildShowModalBottomSheet(context, theme),
                }),
      ]),
    );
  }

  Future _buildShowModalBottomSheet(BuildContext context, ThemeData theme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => _PostCommentListView(),
    );
  }
}

class _PostCommentListView extends StatefulWidget {
  const _PostCommentListView({
    Key key,
  }) : super(key: key);

  @override
  __PostCommentListViewState createState() => __PostCommentListViewState();
}

class __PostCommentListViewState extends State<_PostCommentListView> {
  List<Comment> commentList;
  @override
  void initState() {
    // TODO: implement initState
    //lauch all db related calls here
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      commentList =
          Mock.commentList.map((ele) => Comment.fromJson(ele)).toList();
    final double height = fullHeight(context);
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    final theme = Theme.of(context);
    return Container(
      height: height * 0.8,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: theme.colorScheme.surface,
                ),
                child: ScrollConfiguration(
                  behavior: NeatScrollBehavior(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: commentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: UsersCommentsWidget(commentModel: commentList[index],));
                        }),
                  ),
                ),
              ),
              CommentTexFieldWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: fullWidth(context) * .15,
                    height: 5,
                    decoration: BoxDecoration(
                      color: theme.dividerColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PostDetailContent extends StatelessWidget {
  const _PostDetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.kDark_1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO:Chnage hardcoded text
              Text(
                'Simple, but elegant living room interior at a low cost',
                style: theme.textTheme.headline3.copyWith(
                    fontSize: 18,
                    color: AppColors.kbPureWhite.withOpacity(0.95),
                    fontWeight: FontWeight.bold),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. And its so confusing to see molecules getting robbed. But game of thrones was a good theory. Tellus molestie enim et turpis sagittis blandit aliquam. Ullamcorper dis sed integer velit nisi, maecenas diam sed nunc. Nibh lobortis egestas et, integer non at. Et mauris fermentum habitant tellus auctor in arcu, sodales a.ctor in arcu",
                  style: theme.textTheme.bodyText2
                      .copyWith(color: AppColors.kbPureWhite),
                  maxLines: 6,
                  expandText: 'more',
                  linkColor: AppColors.kbLavender,
                  collapseText: ''),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '2 days ago',
                    style: theme.textTheme.bodyText1
                        .copyWith(color: AppColors.kbDarkGrey, fontSize: 12),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(HelloIcons.location_bold_icon,
                          color: AppColors.kbDarkGrey, height: 14),
                      SizedBox(width: 4),
                      Text('Kakkanad',
                          style: theme.textTheme.bodyText1.copyWith(
                              color: AppColors.kbDarkGrey, fontSize: 12)),
                      SizedBox(width: 4),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),
              _PostDetailCommentPlaceholder(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostDetailTitleHeaders extends StatelessWidget {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.topLeft,
        color: AppColors.kDark_1,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24.0, left: 16, right: 16, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              postedUserSection(context,
                  postedUser: 'Harry James Potter',
                  radiusOfAvatar: 16,
                  postedUserTextStyle: theme.textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.kbPureWhite),
                  userTitle: 'Architect',
                  userTitleTextStyle: theme.textTheme.bodyText2
                      .copyWith(color: AppColors.kbDarkGrey, fontSize: 12)),
              FollowButton(),
            ],
          ),
        ),
      ),
    );
  }
}
