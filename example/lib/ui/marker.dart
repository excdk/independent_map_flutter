import 'package:flutter/material.dart';

class Marker extends StatelessWidget {
  const Marker({this.onTap, super.key});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text("MR"),
        ),
      ),
    );
  }
}
