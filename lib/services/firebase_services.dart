import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> searchUsersByName(String searchKey) async {
  try {
    // Reference to Firestore collection
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('users_data') // Replace 'users' with your collection name
        .where('first_name',
            isEqualTo: searchKey) // Searching by first_name field
        .get();

    // Mapping the results
    List<Map<String, dynamic>> userList =
        result.docs.map((doc) => doc.data()).toList();

    return userList;
  } catch (e) {
    print("Error fetching data: $e");
    return [];
  }
}
