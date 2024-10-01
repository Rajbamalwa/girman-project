import 'package:flutter/material.dart';

void showEmployeeDetailsDialog(BuildContext context, data) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
        titlePadding: EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Fetch Details"),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Here are the details of following employee.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            buildEmployeeDetails(data),
          ],
        ),
      );
    },
  );
}

Widget buildEmployeeDetails(data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        'Name: ${data['first_name'].toString() + " " + data['last_name'].toString()}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      SizedBox(height: 5),
      Text(
        'Location: ${data['city'].toString()}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      SizedBox(height: 5),
      Text(
        'Contact Number: ${data['contact_number'].toString()}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Profile Image:',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      SizedBox(height: 10),
      Image.asset(
        'assets/images/profile_2.png', //
        // Replace with actual image URL
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
      SizedBox(height: 30),
    ],
  );
}
