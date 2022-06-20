import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicleassistant/screens/workshop/whome.dart';

class WrkReg extends StatefulWidget {
  WrkReg({Key? key}) : super(key: key);

  @override
  State<WrkReg> createState() => _WrkRegState();
}

class _WrkRegState extends State<WrkReg> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('workshop name')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('owner pname')),
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
                    border: OutlineInputBorder(), label: Text('address')),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: deviceWidth - 100,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 80, vertical: deviceHeight * .001),
                    child: TextField(
                      // controller: locationcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('location')),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('object');
                      //  gps();
                    },
                    icon: Icon(Icons.my_location))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('phone number')),
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
                    border: OutlineInputBorder(), label: Text('sevices')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('working time')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('password')),
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
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
