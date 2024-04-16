import 'package:flutter/material.dart';

class iconWidget extends StatelessWidget {
  const iconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: Icon(
        Icons.ads_click,
        size: 50,
      ),
    );
  }
}
