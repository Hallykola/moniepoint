import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/theme/palette.dart';

class Calculate extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
        builder: (builder) => const Calculate(),
      );
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  int tag = 1;
  List<String> options = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others'
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController incontroller = TextEditingController();
    TextEditingController outcontroller = TextEditingController();
    TextEditingController weightcontroller = TextEditingController();
    // TextEditingController incontroller = TextEditingController();

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
                  child: Center(
                      child: Text(
                'Calculate',
                style: TextStyle(fontSize: 30, color: Palette.white),
              )))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Destination',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  PackageInput(
                      hint: 'Sender Location',
                      controller: incontroller,
                      image: 'assets/images/packaging.png'),
                  PackageInput(
                      hint: 'Receiver Location',
                      controller: outcontroller,
                      image: 'assets/images/out-of-the-box.png'),
                  PackageInput(
                      hint: 'Approximate Weight',
                      controller: weightcontroller,
                      image: 'assets/images/weighing-machine.png'),
                  Text('Packaging',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  PackageInput(
                      hint: 'Approximate Weight',
                      trailingicon: 'assets/images/unfold.svg',
                      controller: weightcontroller,
                      image: 'assets/images/package.png'),
                  Text('Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  Text('What are you sending?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                  // ChipsChoice<int>.single(
                  //   value: tag,
                  //   onChanged: (val) => setState(() => tag = val),
                  //   choiceItems: C2Choice.listFrom<int, String>(
                  //     source: options,
                  //     value: (i, v) => i,
                  //     label: (i, v) => v,
                  //   ),
                  // )
                  Wrap(
                    
                    children: [
                      ...List.generate(options.length, (int) {
                        return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(14)),
                            child: Text(options[int]));
                      })
                    ],
                  )

                  // ChipList(
                  //   listOfChipNames: [
                  //     'Documents',
                  //     'Glass',
                  //     'Liquid',
                  //     'Food',
                  //     'Electronic',
                  //     'Product',
                  //     'Others'
                  //   ],
                  //   activeBgColorList: [Theme.of(context).primaryColor],
                  //   inactiveBgColorList: [Colors.white],
                  //   activeTextColorList: [Colors.white],
                  //   inactiveTextColorList: [Theme.of(context).primaryColor],
                  //   listOfChipIndicesCurrentlySeclected: [0],
                  //   // borderColorList: [Theme.of(context).primaryColor],
                  // ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class PackageInput extends StatelessWidget {
  const PackageInput({
    super.key,
    required this.controller,
    required this.image,
    required this.hint,
    this.trailingicon,
  });
  final TextEditingController controller;
  final String image;
  final String hint;
  final String? trailingicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        cursorHeight: 30,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          fillColor: Palette.white,
          // labelText: 'Enter your username',
          hintText: hint,
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  //                   <--- right side
                  color: Palette.grayTextColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                image,
                height: 20,
              ),
            ),
          ),
          suffixIcon: (trailingicon != null)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    trailingicon!,
                    height: 8,
                    color: Palette.grayTextColor,
                  ),
                )
              : const SizedBox.shrink(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Colors.grey, width: 2),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide:
          //       BorderSide(color: Colors.grey, width: 1.5),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   gapPadding: 0.0,
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Colors.red, width: 1.5),
          // ),
        ),
        style:
            const TextStyle(fontSize: 20.0, height: 1.0, color: Colors.black),
      ),
    );
  }
}
