import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            '${tips.imgurl}',
            width: 90,
            height: 90,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${tips.title}',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                'Updated ${tips.date}',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 24,
                color: greyColor,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
