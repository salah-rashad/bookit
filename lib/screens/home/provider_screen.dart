import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bookit/screens/home/provider_info.dart';
import 'package:bookit/ui/apptheme.dart';


class ProviderScreen extends StatefulWidget {

  @override
  _ProviderScreenState createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _heightFactorAnimation ;
  double heightFactor = 0.67;
  double collapsedHeightFactor = 0.60;
  double expandedHeightFactor = 0.30;
  bool isAnimationCompleted = false ;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    _heightFactorAnimation = Tween<double>(begin: collapsedHeightFactor,end: expandedHeightFactor).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }


  onBottomPartTap(){
    setState(() {
      if(isAnimationCompleted){
        _controller.reverse();

      }else{
        _controller.forward();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }

  Widget getWidget(){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value,
          child:
          Image.asset('images/saudihospital.jpg',
            fit: BoxFit.contain,colorBlendMode: BlendMode.hue,color: Colors.black,
          ),
        ),
        GestureDetector(
          onDoubleTap: (){
            onBottomPartTap();
          },
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.05- _heightFactorAnimation.value,
            child: Container(
              padding: EdgeInsets.only(right: 32,left: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color:  Colors.black54,
                        blurRadius:45,
                        offset: Offset(0, 4),
                        spreadRadius: -15
                    )
                  ],
                  color: offWhite
              ),
              child: Container(
                child: ProviderInfo(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: AnimatedBuilder(
          animation: _controller,
          builder: (context , widget){
            return getWidget();
          },
        ),
      ),
    );
  }
}

