import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gọi onTap bằng cách sử dụng ()
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: color ?? Color(0xff0ACF83),
          borderRadius: BorderRadius.circular(10.0), // Đặt giá trị bán kính tùy ý
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )

    );
  }
}
