import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton(this.icon, {this.onTap, super.key});

  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
