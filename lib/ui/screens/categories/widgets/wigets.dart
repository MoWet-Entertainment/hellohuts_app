import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/ui/screens/categories/categories_screen.dart';

List<StaggeredTile> _staggeredTileList = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1)
];

class NormalGrid extends StatelessWidget {
  const NormalGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Custom Grid");
    return SliverStaggeredGrid.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
        itemBuilder: (context, index) =>
            Image.network(imageList[index].imageUrlList[0], fit: BoxFit.cover),

        itemCount: 20);
  }
}


class CategoriesStaggeredGrid extends StatelessWidget {
  const CategoriesStaggeredGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("InstagramSearchGrid  Created");

    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          index == 0
              ? 1
              : (index % 7 == 0)
                  ? 2
                  : 1,
          index == 0
              ? 1
              : (index % 7 == 0)
                  ? 2
                  : (index % 9 == 0)
                      ? 2
                      : 1),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 3.0,
    );
  }
}