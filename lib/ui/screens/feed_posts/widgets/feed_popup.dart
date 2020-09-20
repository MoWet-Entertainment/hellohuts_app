import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/popup_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

void showPopupMenu(
  BuildContext context,
  FeedModel model,
  Offset offset,
) async {
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
          trailing: Icon(HelloIcons.plus_circle,
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
            HelloIcons.share,
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
            HelloIcons.thumbs_down,
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
            HelloIcons.eye,
            size: 16.0,
            color: AppColors.kDarkGrey,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          title: Text(
            "Report",
            style: AppThemes.popUpStyle,
          ),
          onTap: state.handlePostReportClick,
        ),
      ),
    ],
  );
}

void openBottonSheet(BuildContext context, FeedModel model) async {
  
  //TODO: Play with Auth State somewhere here
    var state = Provider.of<PopupState>(context, listen: false);
state.setFeedModel = model;
  await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      
      builder: (context) {
        
        return Container(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          height: fullHeight(context) *0.44,
          //TODO: Maintain heigt as per options
          width: fullWidth(context),
          decoration: BoxDecoration(
            color: AppColors.kPureWhite,
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            )
          ),
          child: _bottomSheetItems(context, model),

        );
      });
}

      Widget _bottomSheetItems(BuildContext context, FeedModel model){
        //TODO: Update the List Style to a better container
         var state = Provider.of<PopupState>(context, listen: false);
        return Column(children: <Widget>[
               Container(
          width: fullWidth(context) * .1,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        _widgetBottomSheetRow(context, HelloIcons.plus_circle, text: "Add to board",isEnable: true,onPressed: state.handleAddToBoard),
           _widgetBottomSheetRow(context, HelloIcons.share, text: "Share to",isEnable: true,onPressed: state.handleShareClick),             
         _widgetBottomSheetRow(context, HelloIcons.thumbs_down, text: "Not Interested",isEnable: true,onPressed: state.handleNotIntersetedClick), 
         _widgetBottomSheetRow(context, HelloIcons.eye, text: "Report",isEnable: true,onPressed: state.handlePostReportClick), 
        //TODO: isEnable need to be implemented
          
        ],);
      
      }
      



  Widget _widgetBottomSheetRow(BuildContext context, IconData iconData,
      {String text,Function onPressed, bool isEnable = false}) {
    return Expanded(
      child: customInkWell(
        context: context,
        onPressed: () {
          if (onPressed != null)
            onPressed();
          else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Icon(iconData,size: 24, color:AppColors.kDarkGrey,),
              SizedBox(
                width: 15,
              ),
              customText(
                text,
                context: context,
                style: TextStyle(
                  
                  color:isEnable ? AppColors.kDarkGrey : AppColors.kMediumGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }