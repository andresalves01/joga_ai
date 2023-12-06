import 'package:flutter/material.dart';

class AirbnbTab extends StatelessWidget {
  final String name;
  final IconData icon;
  final double width;
  const AirbnbTab({
    super.key,
    required this.name,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
        height: 69.0,
        icon: Icon(
          icon,
          size: 30.0,
        ),
        child: SizedBox(
          width: width,
          child: Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )),
        ));
  }
}
