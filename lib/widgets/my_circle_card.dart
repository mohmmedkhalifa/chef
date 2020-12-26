import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 8,
        type: MaterialType.circle,
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 95,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    translator.translate(text),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'DNT',
                    ),
                  ),
                ),
              ),
            ],
          ),
          width: size.width*(150/size.width),
          height: size.height*(150/size.height),
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
