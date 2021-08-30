import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 120,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color(0xffF2F4F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                child: Image.asset(
                  city.imageUrl,
                  width: 150,
                  height: 102,
                  fit: BoxFit.cover,
                ),
              ),
              city.isPopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.circular(18),
                            )),
                        child: Center(
                          child: Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(height: 11),
          Text(
            city.name,
            style: blackTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
