import 'package:flutter/material.dart';

class layoutUtils {
  static Widget iconText(Icon iconwidget, Text textwidget) {
    return Row(
      children: [
        iconwidget,
        SizedBox(
          width: 5,
        ),
        textwidget
      ],
    );
  }
}
