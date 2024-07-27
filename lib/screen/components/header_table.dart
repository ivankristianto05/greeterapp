import 'package:flutter/material.dart';
import 'package:greeterapp/constants.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final containerWidth = isPortrait ? screenWidth * 0.8 : screenWidth * 0.4; // Adjust the percentage as needed
    final spacing = isPortrait ? screenWidth * 0.10 : screenWidth * 0.5;
    return Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: HeaderColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: containerWidth * 0.4, // Adjust the width as needed
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(
                          fontSize: HeaderTextNama,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "kamar",
                        style: TextStyle(
                          fontSize: 12,
                          color: TeksKamarColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: spacing), // Adjust the width value
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: containerWidth * 0.3, // Adjust the width as needed
                    padding: const EdgeInsets.only(left: 20), // Increase the left padding value
                    child: Text(
                      "Check",
                      style: TextStyle(
                        fontSize: HeaderTextNama,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: containerWidth * 0.2, // Adjust the width as needed
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}