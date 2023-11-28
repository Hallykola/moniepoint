import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/calculate/views/calculate_provider.dart';
import 'package:moniepointtest/mywidgets/myavatar.dart';
import 'package:moniepointtest/mywidgets/navbar.dart';
import 'package:moniepointtest/search/views/searchscreen.dart';
import 'package:moniepointtest/theme/palette.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CalculateProvider>(create: (_) => CalculateProvider()),

      ],
      child:
        MaterialApp(
          title: 'Moniepoint Test',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Noto',
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),

    );
  }
}

class HomePage extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
        builder: (builder) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> vehicles = [
    {
      "title": "Ocean frieght",
      "subtitle": 'International',
      "image": "assets/images/cargo.jpeg"
    },
    {
      "title": "Cargo frieght",
      "subtitle": 'Reliable',
      "image": "assets/images/cargo.jpeg"
    },
    {
      "title": "Ocean frieght",
      "subtitle": 'International',
      "image": "assets/images/cargo.jpeg"
    }
  ];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      bottomNavigationBar: NavBar(context, currentIndex: 0),

      backgroundColor: const Color.fromRGBO(66, 37, 138, 1),
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(children: [
          ListTile(
            leading: MyAvatar(
              radius: MediaQuery.of(context).size.shortestSide * 0.1,
              borderRadius: MediaQuery.of(context).size.shortestSide * 0.15,
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/sendmessage.png',
                  height: 18,
                  color: Palette.white,
                ),
                const SizedBox(width: 8),
                const Text('Your location',
                    style: TextStyle(color: Palette.white, fontSize: 12)),
              ],
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Wertheimer, Illinios',
                    style: TextStyle(color: Palette.white, fontSize: 16)),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/images/unfold.svg',
                  height: 18,
                  color: Palette.white,
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Palette.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/images/notification.svg',
                height: 25,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Hero(
            tag: "search",
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(SearchScreen.route());
              },
              child: AbsorbPointer(
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
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
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
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Palette.dullWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Tracking', style: TextStyle(fontSize: 18)),
                  ShipmentCard(),
                  const Text('Available Vehicles',
                      style: TextStyle(fontSize: 18)),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vehicles.length,
                        itemBuilder: (context, index) {
                          return VehiclesCard(
                              title: vehicles[index]["title"] ?? '',
                              subtitle: vehicles[index]["subtitle"] ?? '',
                              image: vehicles[index]["image"] ?? '');
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

class VehiclesCard extends StatelessWidget {
  const VehiclesCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: MediaQuery.of(context).size.width * 0.35,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          // const Spacer(),
          SizedBox(height: 10),
          Text(subtitle,
              style: TextStyle(fontSize: 12, color: Palette.grayTextColor)),
          SizedBox(height: 10),

          Image.asset(image)
        ],
      ),
    );
  }
}

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Card(
        color: Palette.white,
        elevation: 8,
        child: Column(
          children: [
            ListTile(
              title: Text('Shipment Number', style: TextStyle(fontSize: 12)),
              subtitle:
                  Text('NEEJ200089934122231', style: TextStyle(fontSize: 18)),
              trailing: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Palette.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/forklift.png',
                  height: 50,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/package.png',
                        height: 35,
                      ),
                      title: Text('Sender', style: TextStyle(fontSize: 12)),
                      subtitle:
                          Text('Atlanta, 5243', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time'),
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.tagGreen),
                            ),
                            const SizedBox(width: 10),
                            Text('2 days - 3 days')
                          ],
                        )
                      ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/package.png',
                        height: 35,
                      ),
                      title: Text('Receiver', style: TextStyle(fontSize: 12)),
                      subtitle:
                          Text('Chicago, 6342', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status'),
                        Row(
                          children: [Text('Waiting to collect')],
                        )
                      ]),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('+ Add Stop',
                    style: TextStyle(color: Palette.tagOrange)))
          ],
        ),
      ),
    );
  }
}
