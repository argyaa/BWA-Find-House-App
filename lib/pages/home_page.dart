import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:provider/provider.dart';
import '../widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecomendedSpace();

    return Scaffold(
      body: SafeArea(
        // NOTE : Title / Header
        child: ListView(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Mencari kosan yang cozy',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 30),

                  // NOTE : Popular cites
                  Text(
                    'Popular Cities',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CityCard(
                          City(
                            id: 1,
                            imageUrl: 'assets/city1.png',
                            name: 'Jakarta',
                          ),
                        ),
                        CityCard(
                          City(
                            id: 2,
                            imageUrl: 'assets/city2.png',
                            name: 'Bandung',
                            isPopular: true,
                          ),
                        ),
                        CityCard(
                          City(
                            id: 3,
                            imageUrl: 'assets/city3.png',
                            name: 'Surabaya',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Recomended Space',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  FutureBuilder<List<Space>>(
                      future: spaceProvider.getRecomendedSpace(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var data = snapshot.data;
                          return Column(
                            children:
                                data.map((item) => SpaceCard(item)).toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  Text(
                    'Tips & Guidance',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        TipsCard(
                          Tips(
                            id: 1,
                            imgurl: 'assets/tips1.png',
                            title: 'City Guidelines',
                            date: '20 Apr',
                          ),
                        ),
                        TipsCard(
                          Tips(
                            id: 1,
                            imgurl: 'assets/tips2.png',
                            title: 'Jakarta Fairship',
                            date: '11 Dec',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50 + 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.fromLTRB(0, 0, 24, 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageurl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
