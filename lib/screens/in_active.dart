import 'package:chefo/widgets/error_login.dart';
import 'package:flutter/material.dart';

class InActive extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ErrorLogin(size: size,),
        ],
      ),
    );
  }
}
