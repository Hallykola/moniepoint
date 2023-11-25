import 'package:flutter/material.dart';


class MyAvatar extends StatelessWidget {
  const MyAvatar({
    Key? key,
    required this.radius,
    required this.borderRadius,
  }) : super(key: key);
  // MediaQuery.of(context).size.shortestSide * 0.2
  final radius;
  // MediaQuery.of(context).size.shortestSide * 0.3
  final borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigator.push(context, ViewProfilePicture.route());
      },
      child: CircleAvatar(
        radius: radius,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child:
                // (!isEmpty(context.watch<BaseUserEntity>().docData?['picture']))
                //     ?
                 
                //     ImageService.cachedImage(context
                //         .watch<DashboardController>()
                //         .baseUserEntity
                //         .docData?['picture'])
                //     : 
                    Image.asset("assets/images/profilepix.jpeg")),
      ),
    );
  }
}
