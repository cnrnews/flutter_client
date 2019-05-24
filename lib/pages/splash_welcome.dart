import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'login.dart';
class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
           Navigator.of(context).pushAndRemoveUntil(
             //Login
          MaterialPageRoute(builder: (context)=>BottomNavagationBarWidget()), 
          (route)=> route==null);
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
      _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://goss.veer.com/creative/vcg/veer/800water/veer-312550106.jpg',
        fit: BoxFit.cover,
        scale: 2.0,
      ),
    );
  }
}
