import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  Widget _menuHeader() {
    final state = Provider.of<AuthState>(context);
    if (state.userModel == null) {
      return customInkWell(
        context: context,
        onPressed: () {
          //  Navigator.of(context).pushNamed('/signIn');
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 200, minHeight: 100),
          child: Center(
            child: Text(
              'Login to continue',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              margin: EdgeInsets.only(left: 17, top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            ListTile(
              onTap: () {
                _navigateTo("ProfilePage");
              },
            ),
          ],
        ),
      );
    }
  }

  Widget _tappbleText(
      BuildContext context, String count, String text, String navigateTo) {
    return InkWell(
      onTap: () {
        var authstate = Provider.of<AuthState>(context, listen: false);
        // authstate.profileFollowingList = [];
        // authstate.getProfileUser();
        _navigateTo(navigateTo);
      },
      child: Row(
        children: <Widget>[
          customText(
            '$count ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          customText(
            '$text',
            style: TextStyle(color: AppColors.kbDarkGrey, fontSize: 17),
          ),
        ],
      ),
    );
  }

  ListTile _menuListRowButton(String title,
      {Function onPressed, int icon, bool isEnable = false}) {
    return ListTile(
      leading: Image.asset(
        HelloIcons.professionals_icon,
        height: 24,
      ),
      title: Text(title),
      // onTap: () {
      //   if (onPressed != null) {
      //     onPressed();
      //   }
      // },
      // leading: icon == null
      //     ? null
      //     : Padding(
      //         padding: EdgeInsets.only(top: 5),
      //         child: customIcon(
      //           context,
      //           icon: icon,
      //           size: 25,
      //           iconColor: isEnable ? AppColors.kbDarkGrey : AppColors.kbMediumGrey,
      //         ),
      //       ),
      // title: customText(
      //   title,
      //   style: TextStyle(
      //     fontSize: 20,
      //     color: isEnable ? AppColors.kPrimaryDark : AppColors.kbDarkGrey,
      //   ),
      // ),
    );
  }

  Positioned _footer() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: <Widget>[
          Divider(height: 0),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
                height: 45,
              ),
              Spacer(),
              Container(
                height: 25,
              ),
              SizedBox(
                width: 10,
                height: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _logOut() {
    final state = Provider.of<AuthState>(context, listen: false);
    Navigator.pop(context);
    state.logoutCallback();
  }

  void _navigateTo(String path) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/$path');
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        Theme.of(context).colorScheme.brightness == Brightness.dark
            ? true
            : false;
    return Drawer(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: ThemeOptions.of(context).getSystemUIOverlayStyle(context)
            .copyWith(statusBarColor: Colors.transparent),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: _menuHeader(),
                  ),
                  Divider(),
                  CycleThemeIconButton1(),
                  _menuListRowButton("Pofile"),
                  _menuListRowButton('Lists'),
                  _menuListRowButton('Bookmark'),
                  _menuListRowButton('Moments'),
                  _menuListRowButton('Fwitter ads'),
                  Divider(),
                  _menuListRowButton('Settings and privacy', isEnable: true,
                      onPressed: () {
                    _navigateTo('SettingsAndPrivacyPage');
                  }),
                  _menuListRowButton('Help Center'),
                  Divider(),
                  _menuListRowButton('Logout',
                      icon: null, onPressed: _logOut, isEnable: true),
                ],
              ),
            ),
            _footer()
          ],
        ),
      ),
    );
  }
}
class CycleThemeIconButton1 extends StatelessWidget {
  final IconData icon;

  const CycleThemeIconButton1({Key key, this.icon = Icons.palette})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:  ThemeProvider.controllerOf(context).nextTheme,
           title: Text("Change Theme"),
          trailing: IconButton(
        icon: Icon(icon,color: Theme.of(context).colorScheme.onBackground,),
        onPressed: ThemeProvider.controllerOf(context).nextTheme,
      ),
    );
  }
}