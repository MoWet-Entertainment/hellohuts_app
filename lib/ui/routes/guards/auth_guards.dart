import 'package:auto_route/auto_route.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState<RouterBase> navigator, String routeName, Object arguments) async {
    // TODO: implement canNavigate
    throw UnimplementedError();
  }

}
