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
    return ListView.builder(
      itemCount: widget.document.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> data =
            widget.document[index].data() as Map<String, dynamic>;
        var name =
            data['first_name'].toString() + " " + data['last_name'].toString();

        if (widget.searchKey.toString().isEmpty) {
          return SizedBox();
        } else if (name.toLowerCase().contains(widget.searchKey.toString()) ||
            name.toUpperCase().contains(widget.searchKey.toString()) ||
            name.substring(1).toUpperCase().contains(
                widget.searchKey.toString().substring(1).toUpperCase())) {
          return buildProfileCard(context, data);
        } else {}
        // return buildProfileCard(context, data);
      },
    );
  }
}
