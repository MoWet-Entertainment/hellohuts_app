import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';

class OnboardingData extends StatefulWidget {
  final String imagePath;
  final String title;
  final String desc;

  const OnboardingData({Key key, this.imagePath, this.title, this.desc})
      : super(key: key);
  @override
  _OnboardingDataState createState() =>
      _OnboardingDataState(this.imagePath, this.title, this.desc);
}

class _OnboardingDataState extends State<OnboardingData> {
  final String imagePath;
  final String title;
  final String desc;

  _OnboardingDataState(this.imagePath, this.title, this.desc);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.40,
            image: AssetImage(imagePath),
          ),
          SizedBox(height:12),
          Flexible(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            softWrap: true,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline3 ,
          ),)
          ,),
            SizedBox(
            height: 12.0,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Text(desc, softWrap: true,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyText2.copyWith(fontSize: 14),),)
        ],
      ),
    );
  }
}
