import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/animations/calculate_animation.dart';
import 'package:moniepointtest/homepage/views/homepagescreen.dart';
import 'package:moniepointtest/main.dart';
import 'package:moniepointtest/mywidgets/animatedButton.dart';
import 'package:moniepointtest/theme/palette.dart';

import '../views/calculation_done_screen.dart';

class Calculate extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
        builder: (builder) => const Calculate(),
      );
  const Calculate({super.key});


  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> with SingleTickerProviderStateMixin{
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
  TextEditingController incontroller = TextEditingController();
  TextEditingController outcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  // TextEditingController incontroller = TextEditingController();
  int? selectedChip;
  AnimationController? animationController;
  CalculateAnimator? animator;


  @override
  initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationController?.forward();
    });
    super.initState();
  }

  @override
  dispose(){
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (animationController == null) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 1000), vsync: this);
      animator = CalculateAnimator(
          animationController!, MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    }
    return Sceenframe(content: buildContentContainer(),title:'Calculate');
  }

  Widget buildContentContainer() {
    return Container(
            padding: const EdgeInsets.all(8.0),
            color: Palette.white,
            child: SingleChildScrollView(
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
                      myanimator: animator!,
                      image: 'assets/images/packaging.png'),
                  PackageInput(
                      hint: 'Receiver Location',
                      controller: outcontroller,
                      myanimator: animator!,
                      image: 'assets/images/out-of-the-box.png'),
                  PackageInput(
                      hint: 'Approximate Weight',
                      controller: weightcontroller,
                      myanimator: animator!,
                      image: 'assets/images/weighing-machine.png'),
                  Text('Packaging',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  PackageInput(
                      hint: 'Box',
                      trailingicon: 'assets/images/unfold.svg',
                      controller: weightcontroller,
                      myanimator: animator!,
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
                  SizedBox(height: 8,),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...List.generate(options.length, (index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedChip=index;
                              print(selectedChip);
                            });
                          },
                          child: AnimatedBuilder(
                            animation: animator!.controller,
                            builder: (context,child){
                              return Transform(
                              transform: Matrix4.translationValues(animator!.chipsMovementX.value, 0.0,0.0),
                                child: Container(
                                    padding: const EdgeInsets.all(12
                                ),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      color: (index==selectedChip)? Palette.black: Palette.white,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Text(options[index],style: TextStyle(color: (index==selectedChip)? Palette.white: Palette.black,),)),
                              );}
                          ),
                        );
                      })
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(child: MyAnimatedButton(title: 'Calculate',action:(){
                    Navigator.push(context, CalculationDone.route());
                  })),
                  SizedBox(height: 20,),


                ],
              ),
            ),
          );
  }
}

class Sceenframe extends StatelessWidget {
  const Sceenframe({
    super.key, required this.content, required this.title,
  });
  final Widget content;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavBar(context, currentIndex: 0),
    
      backgroundColor: Palette.appBackground,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Row(
                children: [
                  const SizedBox(width: 14,),
                  GestureDetector(
                      onTap: () {
                        if(Navigator.canPop(context)){
                          Navigator.pop(context);
                        }
                        Navigator.pushReplacement(context, HomePage.route());
                      },
                      child: Image.asset('assets/images/left-arrow.png',
                          height: 25, color: Palette.white)),
                  Expanded(
                      child: Center(
                          child: Text(
                    title,
                    style: TextStyle(fontSize: 30, color: Palette.white),
                  )))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: content
                //buildContentContainer(),
              )
            ]),
          ),
        ),
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
    this.trailingicon, required this.myanimator,

  });
  final TextEditingController controller;
  final String image;
  final String hint;
  final String? trailingicon;
  final CalculateAnimator myanimator;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: myanimator.controller,

      builder:(context,child) {
        return Transform (
          transform: Matrix4.translationValues( 0.0,myanimator.inputMovementY.value, 0.0),
        child: Padding(
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
        ),
      );}
    );
  }
}
