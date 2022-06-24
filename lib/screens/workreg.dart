import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:vehicleassistant/screens/workshop/whome.dart';

import '../Models/authority_model.dart';
import '../constants/constant_data.dart';

class WrkReg extends StatefulWidget {
  WrkReg({Key? key}) : super(key: key);

  @override
  State<WrkReg> createState() => _WrkRegState();
}

class _WrkRegState extends State<WrkReg> {
  final locationcontroller = TextEditingController();

  gps() async {
    print('object');
    var loc = await Location.instance.getLocation();
    print(loc.latitude);
    setState(() {
      locationcontroller.text = '${loc.latitude},${loc.longitude}';
    });
  }

  String? selectedDistrict;
  String? type;
  String? auname;

  List districts = [
    'Kasargod',
    'Kannur',
    'kozhikode',
    'Wayanad',
    'Malapuram',
    'Thrissur',
    'Palakkad',
    'Ernakulam',
    'Idukki',
    'Kottayam',
    'Alappuzha',
    'Pathanamthitta',
    'Kollam',
    'Thiruvananthapuram'
  ];
  List authority = ['corporation', 'Muncipality', 'Panchayath'];

  getData() async {
    final Response res =
        await get(Uri.parse(ConstantData.baseUrl + 'subadmin_detail'));
    final List data = jsonDecode(res.body);
    return data.map((e) => Authority.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  print(snapshot.data);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('workshop name')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('owner name')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: 6,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('address')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('pincode')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 90, vertical: deviceHeight * .001),
                        child: DropdownButton(
                            hint: Text('districts'),
                            value: selectedDistrict,
                            items: districts
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (v) {
                              setState(() {
                                selectedDistrict = v as String;
                              });
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: deviceHeight * .002),
                        child: DropdownButton(
                            hint: Text('Authority type'),
                            value: type,
                            items: authority
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (v) {
                              setState(() {
                                type = v as String;
                              });
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Authority name')),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 90, vertical: deviceHeight * .001),
                      //   child: DropdownButton(
                      //       hint: Text('Authority name'),
                      //       value: auname,
                      //       items: (snapshot.data as List<Authority>)
                      //           .where((element) =>
                      //               element.district == selectedDistrict &&
                      //               element.AuthorityType == type)
                      //           .map((e) => DropdownMenuItem(
                      //                 child: Text(e.name),
                      //                 value: e.name,
                      //               ))
                      //           .toList(),
                      //       onChanged: (v) {
                      //         setState(() {
                      //           auname = v as String;
                      //         });
                      //       }),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: deviceWidth - 100,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80,
                                  vertical: deviceHeight * .001),
                              child: TextField(
                                controller: locationcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text('location')),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                print('object');
                                gps();
                              },
                              icon: Icon(Icons.my_location))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('phone number')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('licence number')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('sevices')),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 80, vertical: deviceHeight * .001),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         label: Text('working time')),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('password')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: deviceHeight * .001),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('confirm password')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 150, vertical: deviceHeight * .001),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Whome();
                                  },
                                ),
                              );
                            },
                            child: Text('Register')),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
