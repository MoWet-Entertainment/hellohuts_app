import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class CategoriesScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CategoriesScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: AppColors.kPureWhite),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                titleSpacing: 8.0,
                backgroundColor: AppColors.kPureWhite,
                elevation: 0,
                bottom:PreferredSize(
                  preferredSize:Size.fromHeight(8.0) ,
                  child: Container(
                    height: 8.0,
                  ),
                ),
                title: _searchField(context),
              ),
              // actions: _getActionButtons(context),
              body: _SearchBodyCategories(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
   
    return GestureDetector(
      onTap: ()=>ExtendedNavigator.root.push(Routes.categoriesSearchPage,),
          child: Container(
        height: 64,
        padding: const EdgeInsets.only(top: 16, bottom: 8.0, left: 24, right: 16),
        child: TextField(
          enabled: false,
          style: AppThemes.searchHintStyle
              .copyWith(color: AppColors.kDarkTextColor, fontSize: 14),
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              fillColor: AppColors.kAliceBlue,
              // isDense: true,
              prefixIcon: 
                  Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Image.asset(
                        HelloIcons.search_icon,
                        color: AppColors.kDarkGrey,
                        height: 22,
                      )),
              prefixIconConstraints: BoxConstraints(maxHeight: 44, maxWidth: 44),
              hintText: AppStrings.searchHintTextForCategories,
              hintStyle: AppThemes.searchHintStyle,
              focusColor: AppColors.kPureWhite,
              filled: true,
             
              contentPadding: const EdgeInsets.only(left: 5, right: 4),
              suffixIconConstraints: BoxConstraints(maxWidth: 40, maxHeight: 40)),

        ),

      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _SearchBodyCategories extends StatelessWidget {
  const _SearchBodyCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("categories"),
      ),
    );
  }
}
