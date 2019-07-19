import 'package:flutter/material.dart';
import 'dart:convert';

import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController keyinput = TextEditingController();
  AllNotes appNotes = AllNotes(notes: List());

  @override
  void initState() {
    readFile().then((notes){
      setState((){
        appNotes = notes;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    keyinput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: keyinput,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "nitika"),
                  ),
                  Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                          final note = Note(data: keyinput.text);
                          appNotes.notes.add(note);
                          writeFile(appNotes);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
