import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortDataRecord extends FirestoreRecord {
  PortDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "port_name" field.
  String? _portName;
  String get portName => _portName ?? '';
  bool hasPortName() => _portName != null;

  // "port_location" field.
  LatLng? _portLocation;
  LatLng? get portLocation => _portLocation;
  bool hasPortLocation() => _portLocation != null;

  // "port_free_boxes" field.
  int? _portFreeBoxes;
  int get portFreeBoxes => _portFreeBoxes ?? 0;
  bool hasPortFreeBoxes() => _portFreeBoxes != null;

  // "port_free_box_numbers" field.
  List<int>? _portFreeBoxNumbers;
  List<int> get portFreeBoxNumbers => _portFreeBoxNumbers ?? const [];
  bool hasPortFreeBoxNumbers() => _portFreeBoxNumbers != null;

  void _initializeFields() {
    _portName = snapshotData['port_name'] as String?;
    _portLocation = snapshotData['port_location'] as LatLng?;
    _portFreeBoxes = castToType<int>(snapshotData['port_free_boxes']);
    _portFreeBoxNumbers = getDataList(snapshotData['port_free_box_numbers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('port_data');

  static Stream<PortDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortDataRecord.fromSnapshot(s));

  static Future<PortDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortDataRecord.fromSnapshot(s));

  static PortDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortDataRecordData({
  String? portName,
  LatLng? portLocation,
  int? portFreeBoxes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'port_name': portName,
      'port_location': portLocation,
      'port_free_boxes': portFreeBoxes,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortDataRecordDocumentEquality implements Equality<PortDataRecord> {
  const PortDataRecordDocumentEquality();

  @override
  bool equals(PortDataRecord? e1, PortDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.portName == e2?.portName &&
        e1?.portLocation == e2?.portLocation &&
        e1?.portFreeBoxes == e2?.portFreeBoxes &&
        listEquality.equals(e1?.portFreeBoxNumbers, e2?.portFreeBoxNumbers);
  }

  @override
  int hash(PortDataRecord? e) => const ListEquality().hash(
      [e?.portName, e?.portLocation, e?.portFreeBoxes, e?.portFreeBoxNumbers]);

  @override
  bool isValidKey(Object? o) => o is PortDataRecord;
}
