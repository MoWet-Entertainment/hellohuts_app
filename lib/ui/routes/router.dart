import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:hellohuts_app/models/user_feed/post_detail.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post_detail.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import 'package:hellohuts_app/ui/screens/search/search_detail.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  BasePage basePage;

  ExplorePage explorePage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideBottom)
  WelcomePage welcomePage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
  SearchPage searchScreen;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideLeft)
  SearchDetail searchDetail;


  PostDetailScreen postDetailScreen;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideBottom)
  PostCommentsDetail commentsDetail;

  // SignIn signIn;
  // SignUp signUp;
  // @MaterialRoute(fullscreenDialog: true)
  // CreatePost create;
}
