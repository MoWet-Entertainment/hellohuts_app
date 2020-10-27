import 'package:flutter/cupertino.dart';
import 'package:hellohuts_app/helper/theme_preferences.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/states/countries.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/states/auth_states/phone_auth.dart';
import 'package:hellohuts_app/states/search/search_categories_state.dart';
import 'package:hellohuts_app/states/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/states/popup_state.dart';
import 'package:hellohuts_app/states/search/search_state_main.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
  ChangeNotifierProvider<DarkThemeProvider>(create: (_) => DarkThemeProvider(),),
  ChangeNotifierProvider<FeedState>(create: (_) => FeedState()),
   ChangeNotifierProvider<PopupState>(create: (_) => PopupState()),
   ChangeNotifierProvider<SearchStateMain>(create: (_) => SearchStateMain()),
      ChangeNotifierProvider<SearchCategoriesState>(create: (_) => SearchCategoriesState()),
   ChangeNotifierProvider<PhoneAuthDataProvider>(create: (_)=>PhoneAuthDataProvider(),),
   ChangeNotifierProvider<CountryProvider>(create: (_)=>CountryProvider(),),
    ChangeNotifierProvider<CostEstimateState>(create: (_)=>CostEstimateState(),),

];
