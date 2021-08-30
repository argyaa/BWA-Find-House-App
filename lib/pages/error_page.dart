import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/error.png"),
            SizedBox(height: 60),
            Text(
              "Where are you going?",
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
            SizedBox(height: 14),
            Text(
              "Seems like the page that you were requested is already gone",
              style: greyTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: purpleColor),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Back to Home",
                      style: whiteTextStyle.copyWith(fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
