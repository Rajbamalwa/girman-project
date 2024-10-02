import 'package:flutter/material.dart';

import '../../widgets/profile_data_widget.dart';

class ProfileViewComponent extends StatefulWidget {
  final searchKey;
  final document;
  const ProfileViewComponent({required this.document, required this.searchKey});

  @override
  State<ProfileViewComponent> createState() => _ProfileViewComponentState();
}

class _ProfileViewComponentState extends State<ProfileViewComponent> {
  @override
  Widget build(BuildContext context) {
    if (widget.searchKey.isEmpty) {
      return SizedBox();
    }
    var filteredList = widget.document.where((doc) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      var name = "${data['first_name']} ${data['last_name']}".toLowerCase();
      return name.contains(widget.searchKey.toString().toLowerCase());
    }).toList();
    if (filteredList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png',
              width: 300,
              fit: BoxFit.contain,
            ),
            Text(
              'No results found.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.document.length,
      itemBuilder: (context, index) {
        if (index >= filteredList.length) {
          return SizedBox();
        }

        final Map<String, dynamic> data =
            filteredList[index].data() as Map<String, dynamic>;
        return buildProfileCard(context, data);
      },
    );
  }
}
