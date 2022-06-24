import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/userhome.dart';

class Porder extends StatefulWidget {
  const Porder({Key? key}) : super(key: key);

  @override
  State<Porder> createState() => _PorderState();
}

class _PorderState extends State<Porder> {
  List items = ['petrol', 'diesel', 'adblue'];

  String? selected;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              child: DropdownButton(
                  hint: Text('product'),
                  value: selected,
                  items: items
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      selected = v as String;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 80, vertical: deviceHeight * .01),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Amount')),
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
                child: Text('order')),
          ],
        ),
      ),
    );
  }
}
