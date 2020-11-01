import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class PinnedWidget extends StatelessWidget {
  const PinnedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIconsOld.paperclip,
            size: 21,
            color: AppColors.kbAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          // Text(
          //   '30',
          //   style: TextStyle(fontSize: 10),
          // )
        ],
      ),
      onTap: () {
        print('User wants to pin the post');
      },
    );
  }
}

class ViewsCountWidget extends StatelessWidget {
  const ViewsCountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIconsOld.eye,
            size: 21,
            color: AppColors.kbAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            '2.3K',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
      },
    );
  }
}