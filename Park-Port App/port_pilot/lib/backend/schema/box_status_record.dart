import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BoxStatusRecord extends FirestoreRecord {
  BoxStatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "port_box" field.
  String? _portBox;
  String get portBox => _portBox ?? '';
  bool hasPortBox() => _portBox != null;

  // "box_number" field.
  int? _boxNumber;
  int get boxNumber => _boxNumber ?? 0;
  bool hasBoxNumber() => _boxNumber != null;

  // "box_status" field.
  bool? _boxStatus;
  bool get boxStatus => _boxStatus ?? false;
  bool hasBoxStatus() => _boxStatus != null;

  void _initializeFields() {
    _portBox = snapshotData['port_box'] as String?;
    _boxNumber = castToType<int>(snapshotData['box_number']);
    _boxStatus = snapshotData['box_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('box_status');

  static Stream<BoxStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BoxStatusRecord.fromSnapshot(s));

  static Future<BoxStatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BoxStatusRecord.fromSnapshot(s));

  static BoxStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BoxStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BoxStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BoxStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BoxStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BoxStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBoxStatusRecordData({
  String? portBox,
  int? boxNumber,
  bool? boxStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'port_box': portBox,
      'box_number': boxNumber,
      'box_status': boxStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class BoxStatusRecordDocumentEquality implements Equality<BoxStatusRecord> {
  const BoxStatusRecordDocumentEquality();

  @override
  bool equals(BoxStatusRecord? e1, BoxStatusRecord? e2) {
    return e1?.portBox == e2?.portBox &&
        e1?.boxNumber == e2?.boxNumber &&
        e1?.boxStatus == e2?.boxStatus;
  }

  @override
  int hash(BoxStatusRecord? e) =>
      const ListEquality().hash([e?.portBox, e?.boxNumber, e?.boxStatus]);

  @override
  bool isValidKey(Object? o) => o is BoxStatusRecord;
}
