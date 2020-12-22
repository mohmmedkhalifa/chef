import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Image.asset('assets/images/back.png', fit: BoxFit.cover,),
    );
  }
}