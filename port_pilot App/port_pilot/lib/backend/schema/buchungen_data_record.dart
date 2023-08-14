import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuchungenDataRecord extends FirestoreRecord {
  BuchungenDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "buchungs_id" field.
  int? _buchungsId;
  int get buchungsId => _buchungsId ?? 0;
  bool hasBuchungsId() => _buchungsId != null;

  // "buchungs_port" field.
  String? _buchungsPort;
  String get buchungsPort => _buchungsPort ?? '';
  bool hasBuchungsPort() => _buchungsPort != null;

  // "buchungs_user_name" field.
  String? _buchungsUserName;
  String get buchungsUserName => _buchungsUserName ?? '';
  bool hasBuchungsUserName() => _buchungsUserName != null;

  // "buchungs_box_nummber" field.
  int? _buchungsBoxNummber;
  int get buchungsBoxNummber => _buchungsBoxNummber ?? 0;
  bool hasBuchungsBoxNummber() => _buchungsBoxNummber != null;

  // "buchungs_start" field.
  String? _buchungsStart;
  String get buchungsStart => _buchungsStart ?? '';
  bool hasBuchungsStart() => _buchungsStart != null;

  // "buchungs_end" field.
  String? _buchungsEnd;
  String get buchungsEnd => _buchungsEnd ?? '';
  bool hasBuchungsEnd() => _buchungsEnd != null;

  void _initializeFields() {
    _buchungsId = castToType<int>(snapshotData['buchungs_id']);
    _buchungsPort = snapshotData['buchungs_port'] as String?;
    _buchungsUserName = snapshotData['buchungs_user_name'] as String?;
    _buchungsBoxNummber = castToType<int>(snapshotData['buchungs_box_nummber']);
    _buchungsStart = snapshotData['buchungs_start'] as String?;
    _buchungsEnd = snapshotData['buchungs_end'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buchungen_data');

  static Stream<BuchungenDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuchungenDataRecord.fromSnapshot(s));

  static Future<BuchungenDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuchungenDataRecord.fromSnapshot(s));

  static BuchungenDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuchungenDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuchungenDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuchungenDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuchungenDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuchungenDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuchungenDataRecordData({
  int? buchungsId,
  String? buchungsPort,
  String? buchungsUserName,
  int? buchungsBoxNummber,
  String? buchungsStart,
  String? buchungsEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'buchungs_id': buchungsId,
      'buchungs_port': buchungsPort,
      'buchungs_user_name': buchungsUserName,
      'buchungs_box_nummber': buchungsBoxNummber,
      'buchungs_start': buchungsStart,
      'buchungs_end': buchungsEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuchungenDataRecordDocumentEquality
    implements Equality<BuchungenDataRecord> {
  const BuchungenDataRecordDocumentEquality();

  @override
  bool equals(BuchungenDataRecord? e1, BuchungenDataRecord? e2) {
    return e1?.buchungsId == e2?.buchungsId &&
        e1?.buchungsPort == e2?.buchungsPort &&
        e1?.buchungsUserName == e2?.buchungsUserName &&
        e1?.buchungsBoxNummber == e2?.buchungsBoxNummber &&
        e1?.buchungsStart == e2?.buchungsStart &&
        e1?.buchungsEnd == e2?.buchungsEnd;
  }

  @override
  int hash(BuchungenDataRecord? e) => const ListEquality().hash([
        e?.buchungsId,
        e?.buchungsPort,
        e?.buchungsUserName,
        e?.buchungsBoxNummber,
        e?.buchungsStart,
        e?.buchungsEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is BuchungenDataRecord;
}
