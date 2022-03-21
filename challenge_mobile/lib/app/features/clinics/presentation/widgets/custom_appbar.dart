import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Image.asset("assets/images/logo_drcash.png", height: 90, width: 90),
        Spacer(),
        Container(
          width: 35,
          height: 35,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(80),
          ),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              "https://colorlib.com/polygon/gentelella/images/img.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
