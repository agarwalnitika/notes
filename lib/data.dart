import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';

part 'data.g.dart';

Future<void> writeFile(AllNotes notes) async {
  final jsonString = json.encode(notes);
  Directory appDirectory = await getApplicationDocumentsDirectory();
  File dataFile = File(appDirectory.path + '/file.json');
  await dataFile.writeAsString(jsonString);
}

Future<AllNotes> readFile() async {
  Directory appDirectory = await getApplicationDocumentsDirectory();
  File dataFile = File(appDirectory.path + '/file.json');
  if (await dataFile.exists()) {
    return AllNotes.fromJson(json.decode(await dataFile.readAsString()));
  } else {
    return AllNotes(notes: List());
  }
}

@JsonSerializable()
class AllNotes {
  AllNotes({this.notes});

  List<Note> notes = List();

  factory AllNotes.fromJson(json) => _$AllNotesFromJson(json);

  Map<String, dynamic> toJson() => _$AllNotesToJson(this);
}

@JsonSerializable()
class Note {
  Note({@required this.data});

  String data;

  factory Note.fromJson(json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
