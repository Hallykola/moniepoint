import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/calculate/views/calculate.dart';
import 'package:moniepointtest/theme/palette.dart';

class ShipmentScreen extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
    builder: (builder) => const ShipmentScreen(),
  );
  const ShipmentScreen({super.key});

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {

  int? selectedChip;

  @override
  Widget build(BuildContext context) {
    return Sceenframe(content: buildContentContainer(),title: 'Shipment History',);
  }

  Container buildContentContainer() {
    return Container(
      //padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      color: Palette.appBackground,
      child: MyTabbedWidget()
    );
  }
}
class MyTabbedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
       
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color:Palette.appBackground,
              child:  TabBar(
                isScrollable: true,
                labelColor: Palette.white,
                indicatorColor: Palette.tagLightorange,
                unselectedLabelColor: Palette.grayTextColor,
                tabs: [
                  _buildTab('All', 12),
                  _buildTab('Completed', 5),
                  _buildTab('In progress', 3),
                  _buildTab('Pending order', 4),
                  _buildTab('Cancelled',0),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Shipments',style:TextStyle(fontSize: 24, fontWeight:FontWeight.w600)),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 content
                  MyListView('Tab 1'),
              
                  // Tab 2 content
                  MyListView('Tab 2'),
              
                  // Tab 3 content
                  MyListView('Tab 3'),
              
                  // Tab 4 content
                  MyListView('Tab 4'),
              
                  // Tab 5 content
                  MyListView('Tab 5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  final String tabName;

  MyListView(this.tabName);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _loadCards() {
    // fetching data from web api, db...
    final fetchedList = [
    ListViewCard(), ListViewCard(), ListViewCard()
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _listItems.add(fetchedList[i]);
          _listKey.currentState!.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      padding: EdgeInsets.only(top: 10),
      initialItemCount: _listItems.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive((Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ))),
          child: _listItems[index],
        );
      },
    );
    // return ListView.builder(
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return ListViewCard();
    //     //   ListTile(
    //     //   title: Text('$tabName Item $index'),
    //     // );
    //   },
    // );
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.refresh),
                      Text('In progress'),
                    ],
                  ),
                  Text('Arriving today!'),
                  Text('Your delivery, \n #NEJ200089934122231 from Atlanta, \n is arriving today!'),

                  Row(
                    children: [
                      Text('\$14000 USD'),
                      Container(
                        height: 5,
                        width:5,
                        color: Palette.grayTextColor,
                      ),
                      Text('Sep 20,2023')
                    ],
                  )

                ],
              ),
              Image.asset('assets/images/package.png', height: 65,)
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildTab(String label, int itemCount) {
  return Tab(
    child: Row(
      children: [
        Text(label),
        SizedBox(width:6),
        if (itemCount>0) Container(
          padding:const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
            decoration:  const BoxDecoration(color: Palette.tagOrange,
            borderRadius:  BorderRadius.all(Radius.circular(8))),
            child: Text('$itemCount')),
      ],
    ),
  );
}
