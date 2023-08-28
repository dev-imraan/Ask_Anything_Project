import 'package:flutter/cupertino.dart';

class CustomImageContainer extends StatelessWidget {
  final String imgpath;
  final Widget child;

  const CustomImageContainer(
      {super.key, required this.child, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgpath), fit: BoxFit.cover)),
      child: child,
    );
  }
}
