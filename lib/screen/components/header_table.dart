import 'package:flutter/material.dart';
import 'package:greeterapp/constants.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final containerWidth = isTablet 
        ? (isPortrait ? screenWidth * 0.7 : screenWidth * 0.5)
        : (isPortrait ? screenWidth * 0.8 : screenWidth * 0.6); // Adjust the percentage as needed
    final spacing = isTablet 
        ? (isPortrait ? screenWidth * 0.381 : screenWidth * 0.69)
        : (isPortrait ? screenWidth * 0.359 : screenWidth * 0.0); // Adjust the percentage as needed

    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: HeaderColor,
          ),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(0.4),
              1: FixedColumnWidth(spacing),
              2: FlexColumnWidth(0.4),
              3: FixedColumnWidth(40), // Adjust as needed
            },
            children: [
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: 11,
                            color: TeksKamarColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: spacing,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns the text slightly lower
                    children: [
                      SizedBox(height: 15), // Adjust this value to move the text down
                      Text(
                        "Check",
                        style: TextStyle(
                          fontSize: HeaderTextNama,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 8),
                    child: PopupMenuButton<String>(
                      onSelected: (String result) {
                        // Handle menu selection result
                        print('Selected: $result');
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'checked',
                          child: Text('Checked'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'unchecked',
                          child: Text('Unchecked'),
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem<String>(
                          value: 'floor 1',
                          child: Text('Floor 1'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'floor 2',
                          child: Text('Floor 2'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'floor 3',
                          child: Text('Floor 3'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'floor 4',
                          child: Text('Floor 4'),
                        ),
                      ],
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
