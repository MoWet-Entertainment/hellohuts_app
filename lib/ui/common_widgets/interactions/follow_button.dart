import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class FollowButton extends StatefulWidget {
  final bool isFollowing;
  final VoidCallback onPressed;
  const FollowButton({
    Key key,
    this.isFollowing = false,
    this.onPressed,
  }) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing;
  @override
  void initState() {
    _isFollowing = widget.isFollowing;
    super.initState();
  }

  _toggleFollowFollowing() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildGestureDetector();
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () => {
        if (widget.onPressed != null) widget.onPressed(),
        _toggleFollowFollowing(),
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn,
        padding: _isFollowing
            ? const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)
            : const EdgeInsets.only(left: 14, right: 16, top: 8, bottom: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: _isFollowing
              ? AppColors.kbDarkGreen.withOpacity(0.2)
              : AppColors.kbPrimaryYellow.withOpacity(0.2),
        ),
        child: _isFollowing
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following',
                    style: AppThemes.normalTextStyle
                        .copyWith(color: AppColors.kbDarkGreen),
                  )
                ],
              )
            : Row(
                children: [
                  Image.asset(
                    HelloIcons.plus_bold_icon,
                    color: AppColors.kbPrimaryYellow,
                    height: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Follow',
                    style: AppThemes.normalTextStyle
                        .copyWith(color: AppColors.kbPrimaryYellow),
                  )
                ],
              ),
      ),
    );
  }
}