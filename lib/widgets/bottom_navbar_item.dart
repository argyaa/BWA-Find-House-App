import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageurl;
  final bool isActive;

  BottomNavbarItem({this.imageurl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageurl,
          width: 26,
          height: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 33,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(100),
                    )),
              )
            : Container(),
      ],
    );
  }
}
