import 'package:flutter/material.dart';
import 'package:greeterapp/constants.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
    required this.appBarWidth,
  });

  final double appBarWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HeaderColor,
      toolbarHeight: 60,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/logo-kontena.png"),
                ),
              ),
            ),
          ),
          SizedBox(width: 100),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: appBarWidth,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Search",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
