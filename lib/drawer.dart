import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        Container(
          height: 100.0,
          color: Colors.black,
          child: UserAccountsDrawerHeader(
            accountName: Text(
              'Niticcka',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
            ),
            accountEmail: Text(
              ' Institue',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/google.jpg'),
                fit: BoxFit.fitHeight,
              ),
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
