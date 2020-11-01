import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/popup_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

void openBottomSheet(BuildContext context, FeedModel model) async {
  
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
            color: AppColors.kbPureWhite,
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            )
          ),
          child: Container(child: Center(child: Text('Hello'),),)

        );
      });
}
