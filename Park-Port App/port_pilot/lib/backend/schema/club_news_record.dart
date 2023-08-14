import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubNewsRecord extends FirestoreRecord {
  ClubNewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "club_name" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  bool hasClubName() => _clubName != null;

  // "club_news" field.
  String? _clubNews;
  String get clubNews => _clubNews ?? '';
  bool hasClubNews() => _clubNews != null;

  // "club_news_titel" field.
  String? _clubNewsTitel;
  String get clubNewsTitel => _clubNewsTitel ?? '';
  bool hasClubNewsTitel() => _clubNewsTitel != null;

  // "club_news_date" field.
  String? _clubNewsDate;
  String get clubNewsDate => _clubNewsDate ?? '';
  bool hasClubNewsDate() => _clubNewsDate != null;

  void _initializeFields() {
    _clubName = snapshotData['club_name'] as String?;
    _clubNews = snapshotData['club_news'] as String?;
    _clubNewsTitel = snapshotData['club_news_titel'] as String?;
    _clubNewsDate = snapshotData['club_news_date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('club_news');

  static Stream<ClubNewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubNewsRecord.fromSnapshot(s));

  static Future<ClubNewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubNewsRecord.fromSnapshot(s));

  static ClubNewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClubNewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubNewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubNewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubNewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubNewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubNewsRecordData({
  String? clubName,
  String? clubNews,
  String? clubNewsTitel,
  String? clubNewsDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'club_name': clubName,
      'club_news': clubNews,
      'club_news_titel': clubNewsTitel,
      'club_news_date': clubNewsDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubNewsRecordDocumentEquality implements Equality<ClubNewsRecord> {
  const ClubNewsRecordDocumentEquality();

  @override
  bool equals(ClubNewsRecord? e1, ClubNewsRecord? e2) {
    return e1?.clubName == e2?.clubName &&
        e1?.clubNews == e2?.clubNews &&
        e1?.clubNewsTitel == e2?.clubNewsTitel &&
        e1?.clubNewsDate == e2?.clubNewsDate;
  }

  @override
  int hash(ClubNewsRecord? e) => const ListEquality()
      .hash([e?.clubName, e?.clubNews, e?.clubNewsTitel, e?.clubNewsDate]);

  @override
  bool isValidKey(Object? o) => o is ClubNewsRecord;
}
