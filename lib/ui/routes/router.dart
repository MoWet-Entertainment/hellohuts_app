
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';

@MaterialAutoRouter()
class $Router {
  // WelcomePage welcome;

  @initial
  BasePage basePage;

  ExplorePage explorePage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideBottom)
  WelcomePage welcomePage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
  SearchPage searchScreen;

  // SignIn signIn;
  // SignUp signUp;
  // @MaterialRoute(fullscreenDialog: true)
  // CreatePost create;
}
