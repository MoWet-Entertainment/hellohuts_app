import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/popup_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



//TODO:REMOVE THIS AS WE ARE NOT USING THIS
class FeedPostCard extends StatelessWidget {
  final FeedModel model;
  const FeedPostCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _postCardContainer(model),
    );
  }

  Widget _postCardContainer(FeedModel model){
     return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: AppColors.kPureWhite,
        ),
        child: Column(
          children: <Widget>[
             _FeedPostTopSection(model: model),  
          ]
          
        ),
      ),
    );
  }
  }
  class _FeedPostTopSection extends StatelessWidget {
  final FeedModel model;
  const _FeedPostTopSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _feedPostTopSection(context, model);
  }

  Widget _feedPostTopSection(BuildContext context, FeedModel list) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 0, top: 16.h, bottom: 8.h),
      child: Row(
        children: <Widget>[
          postedUserSection(context,
              imagePath: list.userAvatar,
              postedUser: list.postedUser,
              userTitle: list.postedUsertitle,
              radiusOfAvatar: 8.w),
          Spacer(),
          GestureDetector(
            child: const Icon(HelloIconsOld.ellipsis_v),
            onTapDown: (TapDownDetails details) {
              _showPopupMenu(context, details.globalPosition);
            },
          
          ),
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context, Offset offset) async {
    var state = Provider.of<PopupState>(context, listen: false);
    double left = offset.dx;
    double top = offset.dy;
    state.setFeedModel = model;
    await showMenu(
 
      context: context,
      position: RelativeRect.fromLTRB(left, top, 16, 0),
      color: AppColors.kLightGrey.withOpacity(0.95),
      elevation: 1,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      items: [
        PopupMenuItem(
          // child: const Text('Share'), value: 'Share',
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            trailing: Icon(HelloIconsOld.plus_circle,
                size: 16.0, color: AppColors.kDarkGrey),
            title: Text(
              "Add to board",
              style: AppThemes.popUpStyle,
            ),
            onTap: state.handleAddToBoard,
          ),
        ),
     
        PopupMenuItem(
          // child: const Text('Share'), value: 'Share',
          child: ListTile(
            dense: true,
            trailing: Icon(
              HelloIconsOld.share,
              size: 16.0,
              color: AppColors.kDarkGrey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(
              "Share to",
              style: AppThemes.popUpStyle,
            ),
            onTap: state.handleShareClick,
          ),
        ),
        PopupMenuItem(
          // child: const Text('Share'), value: 'Share',
          child: ListTile(
            dense: true,
            trailing: Icon(
              HelloIconsOld.thumbs_down,
              size: 16.0,
              color: AppColors.kDarkGrey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(
              "Not Interested",
              style: AppThemes.popUpStyle,
            ),
            onTap: state.handleNotIntersetedClick,
          ),
        ),
        PopupMenuItem(
          // child: const Text('Share'), value: 'Share',
          child: ListTile(
            dense: true,
            trailing: Icon(
              HelloIconsOld.eye,
              size: 16.0,
              color: AppColors.kDarkGrey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(
              "Reporst",
              style: AppThemes.popUpStyle,
            ),
            onTap: state.handlePostReportClick,
          ),
        ),
      ],
    );
  }
}

