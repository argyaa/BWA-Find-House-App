import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  Space space;
  DetailPage({this.space});
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      try {
        if (await canLaunch(url)) {
          launch(url);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ErrorPage()),
          );
        }
      } catch (e) {
        print(e);
        print("cannot launch $url");
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(children: [
              SizedBox(height: 328),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$ ${space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Image.asset(
                                    "assets/icon_star.png",
                                    width: 20,
                                    color: (space.rating < index)
                                        ? Color(0xff989BA1)
                                        : null,
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                image: "assets/icon_kitchen.png",
                                qty: "${space.numOfKitchen}",
                                name: "kitchen",
                              ),
                              FacilityItem(
                                image: "assets/icon_bedroom.png",
                                qty: "${space.numOfBedrooms}",
                                name: "Bedroom",
                              ),
                              FacilityItem(
                                image: "assets/icon_lemari.png",
                                qty: "${space.numOfCupboards}",
                                name: "Big Lemari",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        //* NOTE PHOTOS
                        Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 13),
                        Container(
                            height: 88,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: space.photos.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(14),
                                        bottom: Radius.circular(14),
                                      ),
                                      child: Image.network(
                                        space.photos[index],
                                        width: 125,
                                        height: 95,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                })),
                        SizedBox(height: 30),
                        Text(
                          'Location',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${space.address}",
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl("${space.mapUrl}");
                                },
                                child: Ink(
                                  child: Image.asset(
                                    "assets/btn_location.png",
                                    width: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              color: purpleColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              elevation: 0,
                              onPressed: () {
                                launchUrl('tel:+${space.phone}');
                              },
                              child: Center(
                                child: Text(
                                  "Book Now",
                                  style: whiteTextStyle.copyWith(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  )),
            ]),
            Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/btn_back.png",
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/btn_wishlist.png",
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
