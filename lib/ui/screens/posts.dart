import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/user_feed/feed.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';

class Posts extends StatelessWidget {
  const Posts({Key key, this.model}) : super(key: key);
  final FeedModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(  
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              customText(model.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start),
              SizedBox(
                height: 10,
              ),
              Text(model.description),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 250.0,
                child: model.imagePathList.length ==1? Image.network(model.imagePathList[0]):model.imagePathList.length>1
                   ? new Stack(
                      children:<Widget>[
                    
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: model.imagePathList.map((v) {
                          return Image.network(v);
                        }).toList()),
                         Container(
                           alignment: Alignment.bottomCenter,
                           child: Icon(HelloIconsOld.arrow_right, color: Colors.white,),)
                      ],
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
