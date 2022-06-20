import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicleassistant/screens/userhome.dart';

import 'login_page.dart';

class UserReg extends StatelessWidget {
  UserReg({Key? key}) : super(key: key);
  final usernamecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('username')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('licence number')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('address')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('phone number')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('password')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
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
                        return Userhome();
                      },
                    ),
                  );
                },
                child: Text('Register')),

            // TextButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return LoginPage();
            //       }));
            //     },
            //     child: Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
