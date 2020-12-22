import 'dart:ui';

import 'package:flutter/material.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Colors.red,
    Color(0xffA53B46),
    Colors.red[600],
    Colors.red[400]
  ],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

TextStyle hintStyle =
    TextStyle(fontSize: 16, fontFamily: 'DNT', color: Colors.black);

final KAbout = '''
تطبيق الشيف هو تطبيق متخصص لتوظيف الطباخين في المطاعم والفنادق، حيث يمكن للطباخ التسجيل في التطبيق والبحث عن وظيفة، ويمكن للمطاعم والفنادق التسجيل في التطبيق للإعلان عن حاجتهم للوظائف 
''';

final KTerms = '''
هذا التطبيق يخضع للشروط والأحكام الخاضعة لقوانين وزاة الصحة الفلسطينية، وبموجب هذه القوانين، وبمجرد قبولك لهذه القوانين، فإنك مسؤول عن أي إعلان تقوم به، ومسؤول عن أي شخص تقوم بتوظيفه، ومن هذا المنطلق نؤكد على خلو ذمة أصحاب التطبيق من التعرض للمساءلة القانونية
''';
