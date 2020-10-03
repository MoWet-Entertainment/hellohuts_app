import 'package:hellohuts_app/states/cost_estimate_state.dart';
import 'package:hellohuts_app/states/countries.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/states/auth_states/phone_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/states/popup_state.dart';
import 'package:hellohuts_app/states/search_state.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
  ChangeNotifierProvider<FeedState>(create: (_) => FeedState()),
   ChangeNotifierProvider<PopupState>(create: (_) => PopupState()),
   ChangeNotifierProvider<SearchState>(create: (_) => SearchState()),
   ChangeNotifierProvider<PhoneAuthDataProvider>(create: (_)=>PhoneAuthDataProvider(),),
   ChangeNotifierProvider<CountryProvider>(create: (_)=>CountryProvider(),),
    ChangeNotifierProvider<CostEstimateState>(create: (_)=>CostEstimateState(),),

];
