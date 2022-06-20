import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicleassistant/user/profile.dart';

import '../user/chat.dart';
import '../user/fuel.dart';
import '../user/work.dart';

class Userhome extends StatelessWidget {
  const Userhome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 50, vertical: deviceHeight * .1),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Fuel();
              }));
            },
            leading: Icon(Icons.local_gas_station),
            title: Text('Nearest fuel stations'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Work();
              }));
            },
            leading: Icon(Icons.build),
            title: Text('Nearest Workshops'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Chat();
              }));
            },
            leading: Icon(Icons.forum),
            title: Text('Chat with mechanics'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Prof();
              }));
            },
            leading: Icon(Icons.person),
            title: Text('View profile'),
          )
        ]),
      ),
    );
  }
}
