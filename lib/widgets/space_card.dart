import 'package:flutter/material.dart';
import '../theme.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/detail_page.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(space: space),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              width: 143,
              height: 121,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        space.imageUrl,
                        height: 121,
                        fit: BoxFit.cover,
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.circular(18),
                          )),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'assets/icon_star.png',
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              ' ${space.rating} /5',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${space.name}',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(height: 2),
                Text.rich(
                  TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextStyle.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' / month',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle.copyWith(fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
