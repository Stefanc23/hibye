import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/models/user.dart';

class DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(User user) {
    CollectionReference users = firestore.collection('users');

    return users
        .doc(user.id)
        .set({
          'full_name': user.fullName,
          'email': user.email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addOrganization(
      String userId, String organizationId, String inviteCode) async {
    firestore
        .collection('organizations')
        .doc(organizationId)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        if (documentSnapshot['invite_code'] == inviteCode) {
          return firestore
              .collection('junction_user_organization')
              .doc('${userId}_$organizationId')
              .set({
                'user_id': userId,
                'organization_id': organizationId,
                'role': 'member'
              })
              .then((value) => print("Junction Added"))
              .catchError((error) => print("Failed to add user: $error"));
        }
      }
    });
  }

  Future<void> registerOrganization(String userId, String organizationId,
      String name, String inviteCode, String type) async {
    Organization newOrganization = Organization(
        id: organizationId, name: name, inviteCode: inviteCode, type: type);

    return firestore.collection('organizations').doc('$organizationId').set({
      'organization_id': organizationId,
      'name': name,
      'invite_code': inviteCode,
      'type': type,
    }).then((value) => firestore
        .collection('junction_user_organization')
        .doc('${userId}_$organizationId')
        .set({
          'user_id': userId,
          'organization_id': organizationId,
          'role': 'admin'
        })
        .then((value) => print("Organization Registered"))
        .catchError((error) => print("Failed to add user: $error")));
  }

  Future<List<Organization>> fetchOrganizationsByUser(String userId) async {
    var organizationIds = [];
    var roles = [];
    var i = 0;

    await firestore
        .collection('junction_user_organization')
        .where('user_id', isEqualTo: userId)
        .get()
        .then((value) => (value != null)
            ? value.docs.forEach((doc) {
                organizationIds.add(doc['organization_id']);
                roles.add(doc['role']);
              })
            : null);

    List<Organization> organizations = [];

    if (organizationIds.isNotEmpty) {
      await firestore
          .collection('organizations')
          .where(FieldPath.documentId, whereIn: organizationIds)
          .get()
          .then((value) => value.docs.forEach((doc) {
                Organization organization = Organization(
                    id: FieldPath.documentId.toString(),
                    name: doc['name'],
                    inviteCode: doc['invite_code'],
                    type: doc['type'],
                    role: roles[i++]);
                organizations.add(organization);
              }));
    }

    return organizations;
  }
}
