import 'package:flutter/material.dart';
import 'package:greeterapp/constants.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final containerWidth = isPortrait
        ? screenWidth * 0.8
        : screenWidth * 0.4; // Adjust the percentage as needed
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
                        fontSize: 11,
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
                  padding: const EdgeInsets.only(
                      left: 20), // Increase the left padding value
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
              SizedBox(width: isPortrait? screenWidth * 0.067 : screenWidth * 0.035), // Adjust the width value
              PopupMenuButton<String>(
                onSelected: (String result) {
                  // Tangani hasil pilihan menu
                  print(
                      'Selected: $result'); // Contoh logika pemilihan, Anda bisa menambahkan logika Anda sendiri di sini
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
                  const PopupMenuDivider(), // Pembatas antara item
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
                  size: 24, // Atur ukuran ikon sesuai kebutuhan
                ),
                padding: EdgeInsets.all(
                    0), // Mengatur padding ke 0 untuk memastikan ikon berada di tengah
                constraints: BoxConstraints(
                  minWidth: containerWidth * 0.23,
                  minHeight: containerWidth * 0.23,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Options'),
      content: Text('Here you can put filter options.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
