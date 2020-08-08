import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:hellohuts_app/models/user_feed/post_detail.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post_detail.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import 'package:hellohuts_app/ui/screens/quick_items/quick_items.dart';
import 'package:hellohuts_app/ui/screens/search/search_detail.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';


@MaterialAutoRouter(
  routes:<AutoRoute> [
    AdaptiveRoute(page: BasePage, initial: true),
    AdaptiveRoute(page: ExplorePage  ),
    CustomRoute(page: WelcomePage, transitionsBuilder: TransitionsBuilders.slideBottom ),
    CustomRoute(page: SearchPage, transitionsBuilder: TransitionsBuilders.fadeIn ),
     CustomRoute(page: SearchDetail, transitionsBuilder: TransitionsBuilders.slideLeft ),
     AdaptiveRoute(page: PostDetailScreen ),
 CustomRoute(page: PostCommentsDetail, name: "commentsDetail", transitionsBuilder: TransitionsBuilders.slideBottom ),
      CustomRoute(page: CostEstimate, transitionsBuilder: TransitionsBuilders.fadeIn ),
 CustomRoute(page: Professionals, transitionsBuilder: TransitionsBuilders.fadeIn ),
 CustomRoute(page: MoreItems, transitionsBuilder: TransitionsBuilders.fadeIn ),
  CustomRoute(page: Materials, transitionsBuilder: TransitionsBuilders.fadeIn ),

  ]
)
class $Router {}


// @MaterialAutoRouter()
// class $Router {
//   @initial
//   BasePage basePage;

//   ExplorePage explorePage;

//   @CustomRoute(transitionsBuilder: TransitionsBuilders.slideBottom)
//   WelcomePage welcomePage;

//   @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
//   SearchPage searchScreen;

//   @CustomRoute(transitionsBuilder: TransitionsBuilders.slideLeft)
//   SearchDetail searchDetail;


//   PostDetailScreen postDetailScreen;
//   @CustomRoute(transitionsBuilder: TransitionsBuilders.slideBottom)
//   PostCommentsDetail commentsDetail;

//     @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
//   CostEstimate costEstimate;

//   @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
//   Professionals professionals;
  
//   @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
//   MoreItems moreItems;
  
//   @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
//   Materials materials;

  // SignIn signIn;
  // SignUp signUp;
  // @MaterialRoute(fullscreenDialog: true)
  // CreatePost create;
// }
