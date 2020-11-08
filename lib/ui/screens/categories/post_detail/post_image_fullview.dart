import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/mock1.dart';

class PostImageFullView extends StatefulWidget {
  const PostImageFullView({
    Key key,
    @required this.image,
  }) : super(key: key);

  final ImageData image;
  @override
  _PostImageFullViewState createState() => _PostImageFullViewState();
}

class _PostImageFullViewState extends State<PostImageFullView> {
  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InteractiveViewer(
        panEnabled: false,
        transformationController: transformationController,
        onInteractionEnd: (details) {
          setState(() {
            transformationController.toScene(Offset.zero);
          });
        },
        boundaryMargin: EdgeInsets.all(20.0),
        minScale: 0.1,
        maxScale: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: Image.network(
            widget.image.imageUrlList[0],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
