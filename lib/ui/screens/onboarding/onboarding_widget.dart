import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/screens/onboarding/onboarding_data.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

///This code is heavily dependent on @champ96k, github https://github.com/champ96k/flutter-onboarding-screen/blob/master/lib/flutteronboardingscreens.dart
/// Didnt get time to refactor or optmize the code
//TODO : @vinoopks - please refactor/optimize the code

class OnboardingWidget extends StatefulWidget {
  final List<OnboardingData> onboardingScreenDataList;
  final MaterialPageRoute pageRoute;

  OnboardingWidget({Key key, this.onboardingScreenDataList, this.pageRoute})
      : super(key: key);
  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final PageController _pageController = new PageController();
  int _currentPage = 0;
  bool _lastPage = false;
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
      if (_currentPage == widget.onboardingScreenDataList.length - 1) {
        _lastPage = true;
      } else {
        _lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Builder(
      builder: (context) => Container(
        height: page == _currentPage ? 10.0 : 6.0,
        width: page == _currentPage ? 10.0 : 6.0,
        decoration: BoxDecoration(
          color: page == _currentPage
              ? AppColors.kbPrimaryYellow
              : AppColors.kbMediumGrey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 3,
            child: PageView(
              children: widget.onboardingScreenDataList,
              controller: _pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text(
                    _lastPage ? "" : "Skip",
                    style: theme.textTheme.button,
                  ),
                  onPressed: () => _lastPage ? null : widget.skipPage(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    child: Row(
                      children: widget.onboardingScreenDataList
                          .asMap()
                          .map((index, item) =>
                              MapEntry(index, _buildPageIndicator(index)))
                          .values
                          .toList(),
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () => _lastPage
                        ? widget.skipPage(context)
                        : _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                    child: Text(
                      _lastPage ? "Let's go!" : "Next",
                      style: theme.textTheme.bodyText2.copyWith(fontSize: 16),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
