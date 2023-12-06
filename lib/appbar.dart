import 'package:flutter/material.dart';
import 'pseudosearchbar.dart';
import 'searchfilter.dart';

class AirbnbAppBar extends StatefulWidget {
  final Color backgroundColor;

  const AirbnbAppBar({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  State<AirbnbAppBar> createState() => _AirbnbAppBarState();
}

class _AirbnbAppBarState extends State<AirbnbAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.0,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: const PseudoSearchBar(),
                    onTap: () {},
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: GestureDetector(
                    child: const SearchFilter(),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
