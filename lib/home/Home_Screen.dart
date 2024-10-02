import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../services/firebase_services.dart';
import '../utils/utils.dart';
import '../widgets/webview_widget.dart';
import 'components/profile_view_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  bool searching = false;
  FocusNode focusNode = FocusNode();
  String? selectedOption;
  CollectionReference users =
      FirebaseFirestore.instance.collection('users_data');
  List<Map<String, dynamic>> searchResults = [];

  void searchByName() async {
    String searchKey = _searchController.text.trim();
    if (searchKey.isNotEmpty) {
      List<Map<String, dynamic>> results = await searchUsersByName(searchKey);
      setState(() {
        searchResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/Logo.png',
                  ),
                ],
              ),
              PopupMenuButton<String>(
                color: Colors.white,
                onSelected: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'Search',
                    child: Text(
                      'SEARCH',
                      style: TextStyle(
                        decoration: selectedOption == "Search"
                            ? TextDecoration.underline
                            : null,
                        decorationColor: selectedOption == "Search"
                            ? Colors.blueAccent
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        color: selectedOption == "Search"
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Website',
                    child: Text(
                      'WEBSITE',
                      style: TextStyle(
                        decoration: selectedOption == "Website"
                            ? TextDecoration.underline
                            : null,
                        decorationColor: selectedOption == "Website"
                            ? Colors.blueAccent
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        color: selectedOption == "Website"
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'LinkedIn',
                    child: Text(
                      'LINKEDIN',
                      style: TextStyle(
                        decoration: selectedOption == "LinkedIn"
                            ? TextDecoration.underline
                            : null,
                        decorationColor: selectedOption == "LinkedIn"
                            ? Colors.blueAccent
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        color: selectedOption == "LinkedIn"
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Contact',
                    child: Text(
                      'CONTACT',
                      style: TextStyle(
                        decoration: selectedOption == "Contact"
                            ? TextDecoration.underline
                            : null,
                        decorationColor: selectedOption == "Contact"
                            ? Colors.blueAccent
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        color: selectedOption == "Contact"
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: _getBody());
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(
          left: focusNode.hasFocus || searching == false ? 30 : 10,
          right: focusNode.hasFocus || searching == false ? 30 : 10),
      child: TextField(
        controller: _searchController,
        focusNode: focusNode,
        onTapOutside: (p) {
          focusNode.unfocus();
        },
        onSubmitted: (val) {
          searching = true;
          focusNode.unfocus();
        },
        onChanged: (value) {
          setState(() {
            searching = true;
            searchQuery = value;
            if (value.toString() == "") {
              searching = false;
            }
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            size: 18,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    _searchController.clear();
                    searchQuery = "";
                    searching = false;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.clear,
                    size: 18,
                    color: Colors.red,
                  ),
                )
              : SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: false,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _getBody() {
    switch (selectedOption) {
      case 'Website':
        return WebViewContainer(
          key: ValueKey('website'),
          url: websiteUrl,
        );
      case 'LinkedIn':
        return WebViewContainer(
          key: ValueKey('linkedin'),
          url: linkedInUrl,
        );
      case 'Contact':
        launchEmail(emailAddress);
        return _searchVeiwUser();
      default:
        return _searchVeiwUser();
    }
  }

  Widget _searchVeiwUser() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.blueAccent.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            !focusNode.hasFocus || searching == false
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 20),
                    child: Image.asset(
                      'assets/images/logo2.png',
                    ),
                  )
                : SizedBox(
                    height: 10,
                  ),
            _buildSearchBar(),
            const SizedBox(height: 20),
            if (searchQuery.toString().isEmpty && searching == true)
              Column(
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
                  )
                ],
              ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: users.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;

                        return ProfileViewComponent(
                          searchKey: searchQuery,
                          document: documents,
                        );
                      }
                      return Center(child: Text('No data found'));
                    })),
          ],
        ),
      ),
    );
  }
}
