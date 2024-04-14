import 'package:flutter/material.dart';

class commentText extends StatelessWidget {
  const commentText({
    super.key,
    required this.comment,
  });

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        comment,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}