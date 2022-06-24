import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicleassistant/screens/petrol_register.dart';
import 'package:vehicleassistant/screens/user_register.dart';
import 'package:vehicleassistant/screens/userhome.dart';
import 'package:vehicleassistant/screens/workreg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 50, vertical: deviceHeight * .01),
              child: TextFormField(
                controller: usernamecontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'textfield is empty';
                  } else if (value.length < 3) {
                    return 'username is too short';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('User name')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 50, vertical: deviceHeight * .01),
              child: TextFormField(
                controller: passwordcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password is empty';
                  } else if (value.length < 3) {
                    return 'password is too short';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Password')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton(
                  onPressed: () {
                    formkey.currentState!.validate();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Userhome();
                      }),
                    );
                  },
                  child: Text('Login')),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('sign up as'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserReg();
                      }));
                    },
                    child: Text('user')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Preg();
                      }));
                    },
                    child: Text('petrol pumb')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WrkReg();
                      }));
                    },
                    child: Text('workshop')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
