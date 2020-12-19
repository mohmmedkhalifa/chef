import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleCard extends StatelessWidget {
  CircleCard({
    Key key,
    this.text,
    this.image,
    this.onTap,
  }) : super(key: key);

  String text;
  String image;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 8,
        type: MaterialType.circle,
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              Container(height: 95.h,),
              Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24, fontFamily: 'DNT'),
                ),
              ),
            ],
          ),
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
    );
  }
}