import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepointtest/theme/palette.dart';

class SearchScreen extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
        builder: (builder) => const SearchScreen(),
      );
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavBar(context, currentIndex: 0),

      backgroundColor: const Color.fromRGBO(66, 37, 138, 1),
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/left-arrow.png',
                      height: 25, color: Palette.white)),
              Expanded(
                child: Hero(
                  tag: 'search',
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Palette.white,
                        // labelText: 'Enter your username',
                        hintText: "Enter your receipt number",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/receipt.png',
                            height: 25,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Palette.dullWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset('assets/images/package.png'),
                            title: Text('Macbook Pro'),
                            subtitle: Text('#NE4885. Paris -> Morroco'),
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
