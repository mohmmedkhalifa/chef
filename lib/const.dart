import 'dart:ui';

import 'package:flutter/material.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.red,Color(0xffA53B46), Colors.red[600], Colors.red[400]],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);
