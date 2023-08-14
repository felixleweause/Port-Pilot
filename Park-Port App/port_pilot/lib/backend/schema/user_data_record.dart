import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataRecord extends FirestoreRecord {
  UserDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "home_port" field.
  String? _homePort;
  String get homePort => _homePort ?? '';
  bool hasHomePort() => _homePort != null;

  // "box_number" field.
  int? _boxNumber;
  int get boxNumber => _boxNumber ?? 0;
  bool hasBoxNumber() => _boxNumber != null;

  // "schiffsname" field.
  String? _schiffsname;
  String get schiffsname => _schiffsname ?? '';
  bool hasSchiffsname() => _schiffsname != null;

  // "schiffstiefe" field.
  int? _schiffstiefe;
  int get schiffstiefe => _schiffstiefe ?? 0;
  bool hasSchiffstiefe() => _schiffstiefe != null;

  // "box_status" field.
  bool? _boxStatus;
  bool get boxStatus => _boxStatus ?? false;
  bool hasBoxStatus() => _boxStatus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _homePort = snapshotData['home_port'] as String?;
    _boxNumber = castToType<int>(snapshotData['box_number']);
    _schiffsname = snapshotData['schiffsname'] as String?;
    _schiffstiefe = castToType<int>(snapshotData['schiffstiefe']);
    _boxStatus = snapshotData['box_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_data');

  static Stream<UserDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDataRecord.fromSnapshot(s));

  static Future<UserDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDataRecord.fromSnapshot(s));

  static UserDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDataRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  String? homePort,
  int? boxNumber,
  String? schiffsname,
  int? schiffstiefe,
  bool? boxStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'home_port': homePort,
      'box_number': boxNumber,
      'schiffsname': schiffsname,
      'schiffstiefe': schiffstiefe,
      'box_status': boxStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDataRecordDocumentEquality implements Equality<UserDataRecord> {
  const UserDataRecordDocumentEquality();

  @override
  bool equals(UserDataRecord? e1, UserDataRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.homePort == e2?.homePort &&
        e1?.boxNumber == e2?.boxNumber &&
        e1?.schiffsname == e2?.schiffsname &&
        e1?.schiffstiefe == e2?.schiffstiefe &&
        e1?.boxStatus == e2?.boxStatus;
  }

  @override
  int hash(UserDataRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoUrl,
        e?.homePort,
        e?.boxNumber,
        e?.schiffsname,
        e?.schiffstiefe,
        e?.boxStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is UserDataRecord;
}
