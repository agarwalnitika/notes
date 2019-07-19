import 'package:flutter/material.dart';

import './drawer.dart';
import './home.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var primary_Color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nitika',
      theme: ThemeData(
        primaryColor: primary_Color,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  AllNotes appNotes = AllNotes(notes: List());

  @override
  void initState() {
    _readHomeFile();
    super.initState();
  }

  void _readHomeFile() {
    readFile().then((notes) {
      setState(() {
        appNotes = notes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          ).then((_) {
            _readHomeFile();
          });
        },
        heroTag: "Demo",
      ),
      drawer: Drawer(
        child: SideBar(),
      ),
      appBar: AppBar(
        title: Text('July'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.linear_scale),
            onPressed: null,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: appNotes.notes.length,
          itemBuilder: (builder, index) {
            return NoteWidget(noteData: appNotes.notes[index].data);
          }),
    );
  }
}

class NoteWidget extends StatelessWidget {
  NoteWidget({@required this.noteData});

  final String noteData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(noteData),
        ),
      ),
    );
  }
}
