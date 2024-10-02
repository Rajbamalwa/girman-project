// Single profile card
import 'package:flutter/material.dart';

import '../utils/dialog.dart';

Widget buildProfileCard(context, data) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
    child: Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
            Text(
              data['first_name'].toString() +
                  " " +
                  data['last_name'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, size: 12, color: Colors.blueGrey),
                SizedBox(width: 5),
                Text(
                  data['city'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                      color: Colors.blueGrey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 0.6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, size: 12, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            data['contact_number'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Available on phone',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showEmployeeDetailsDialog(context, data);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Fetch Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
