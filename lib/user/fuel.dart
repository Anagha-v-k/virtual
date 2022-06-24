import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:vehicleassistant/user/petrolorder.dart';

class Fuel extends StatelessWidget {
  Fuel({Key? key}) : super(key: key);

  final userLocation = '11.304020540521964,75.75696906515643';

  var petrolPumps = [
    {'name': 'pumb1', 'coordinates': '11.302800136009576,75.76851329200237'},
    {'name': 'pumb2', 'coordinates': '11.3028001360095456,75.76851329300237'}
  ];

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: petrolPumps.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Porder()));
                },
                child: Card(
                  child: ListTile(
                    title: Text(petrolPumps[index]['name']!),
                    subtitle: Text(calculateDistance(
                            double.parse(userLocation.split(',').first),
                            double.parse(userLocation.split(',')[1]),
                            double.parse(petrolPumps[index]['coordinates']!
                                .split(',')
                                .first),
                            double.parse(petrolPumps[index]['coordinates']!
                                .split(',')[1]))
                        .toString()),
                  ),
                ),
              );
            }));
  }
}
