// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNotes _$AllNotesFromJson(Map<String, dynamic> json) {
  return AllNotes(
      notes: (json['notes'] as List)
          ?.map((e) => e == null ? null : Note.fromJson(e))
          ?.toList());
}

Map<String, dynamic> _$AllNotesToJson(AllNotes instance) =>
    <String, dynamic>{'notes': instance.notes};

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(data: json['data'] as String);
}

Map<String, dynamic> _$NoteToJson(Note instance) =>
    <String, dynamic>{'data': instance.data};
