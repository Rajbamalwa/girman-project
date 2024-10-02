import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> searchUsersByName(String searchKey) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('users_data')
        .where('first_name', isEqualTo: searchKey)
        .get();

    List<Map<String, dynamic>> userList =
        result.docs.map((doc) => doc.data()).toList();

    return userList;
  } catch (e) {
    print("Error fetching data: $e");
    return [];
  }
}
