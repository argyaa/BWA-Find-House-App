import 'dart:convert';

import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecomendedSpace() async {
    try {
      var endpoint =
          Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
      var result = await http.get(endpoint);
      print(result.statusCode);
      print(result.body);
      if (result.statusCode == 200) {
        List data = await jsonDecode(result.body);
        print("data $data");

        List<Space> spaces = [];
        data.forEach((data) {
          spaces.add(Space.fromjson(data));
        });

        return spaces;
      } else {
        return <Space>[];
      }
    } catch (e) {
      print(e);
    }
  }
}
