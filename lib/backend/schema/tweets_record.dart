import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TweetsRecord extends FirestoreRecord {
  TweetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tweets')
          : FirebaseFirestore.instance.collectionGroup('tweets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tweets').doc();

  static Stream<TweetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TweetsRecord.fromSnapshot(s));

  static Future<TweetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TweetsRecord.fromSnapshot(s));

  static TweetsRecord fromSnapshot(DocumentSnapshot snapshot) => TweetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TweetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TweetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TweetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TweetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTweetsRecordData({
  String? name,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class TweetsRecordDocumentEquality implements Equality<TweetsRecord> {
  const TweetsRecordDocumentEquality();

  @override
  bool equals(TweetsRecord? e1, TweetsRecord? e2) {
    return e1?.name == e2?.name && e1?.uid == e2?.uid;
  }

  @override
  int hash(TweetsRecord? e) => const ListEquality().hash([e?.name, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is TweetsRecord;
}
