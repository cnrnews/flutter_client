import 'package:flutter/material.dart';

//贝塞尔曲线
class ClipperWidget extends StatelessWidget {
  final Widget child;
  ClipperWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔曲线'),
      ),
      body: ClipPath(
        clipper: SineClipper(),
        child: Container(
          height: 200.0,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
//贝塞尔曲线
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);

    var firstCenterPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstCenterPoint.dx, firstCenterPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
//正弦曲线
class SineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height -20);

    var firstCenterPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height-30);

    path.quadraticBezierTo(firstCenterPoint.dx, firstCenterPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondCenterPoint = Offset(size.width / 4 * 3, size.height-80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondCenterPoint.dx, secondCenterPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
