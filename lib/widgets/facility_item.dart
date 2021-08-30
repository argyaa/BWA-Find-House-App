import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class FacilityItem extends StatelessWidget {
  String image;
  String name;
  String qty;

  FacilityItem({this.image, this.name, this.qty});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image, width: 34, height: 32),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: qty,
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: " " + name,
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }
}
