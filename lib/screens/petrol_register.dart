import 'package:flutter/material.dart';

// import 'package:location/location.dart';
import 'package:vehicleassistant/screens/petrolpumb/petrolhome.dart';

class Preg extends StatefulWidget {
  Preg({Key? key}) : super(key: key);

  @override
  State<Preg> createState() => _PregState();
}

class _PregState extends State<Preg> {
  final locationcontroller = TextEditingController();

  gps() async {
    print('object');
    // var loc = await Location.instance.getLocation();
    // print(loc.latitude);
    // setState(() {
    //   locationcontroller.text = loc.latitude.toString();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('companyname')),
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
                    border: OutlineInputBorder(), label: Text('ownername')),
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
                    border: OutlineInputBorder(), label: Text('mobile number')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('work starting time')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .001),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('work ending time')),
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
                        return Phome();
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
