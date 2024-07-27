import 'package:flutter/material.dart';
import 'package:greeterapp/constants.dart';
import 'package:greeterapp/data/booking.dart';
import 'package:greeterapp/screen/components/appbar_section.dart';
import 'package:greeterapp/screen/components/header_table.dart';

class GreeterScreen extends StatefulWidget {
  const GreeterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GreeterScreenState createState() => _GreeterScreenState();
}

class _GreeterScreenState extends State<GreeterScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final containerWidth = isPortrait
        ? screenWidth * 0.8
        : screenWidth * 0.4; // Adjust the percentage as needed
    final appBarWidth = isPortrait
        ? screenWidth * 0.8
        : screenWidth * 0.6; // Adjusted width for better responsiveness
    final spacing = isPortrait
        ? screenWidth * 0.1
        : screenWidth * 0.2; // Reduced spacing for both orientations

    return Scaffold(
      appBar: BuildAppBar(appBarWidth: appBarWidth),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderTable(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(bookingData.length, (index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: screenWidth *
                                  0.6, // Adjust the width as needed
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookingData[index]['nama'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    softWrap:
                                        true, // Allow text to wrap to the next line
                                  ),
                                  Text(
                                    bookingData[index]['kamar'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: spacing),
                            Expanded(
                              child: Container(
                                width: containerWidth * 0.3,
                                alignment: Alignment.centerRight,
                                child: Checkbox(
                                  value:
                                      bookingData[index]['status'] == 'checked',
                                  onChanged: (bool? value) {
                                    setState(() {
                                      bookingData[index]['status'] =
                                          value! ? 'checked' : 'unchecked';
                                      print(
                                          'Guest: ${bookingData[index]['nama']}, Room: ${bookingData[index]['kamar']}, Status: ${bookingData[index]['status']}');
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                                width: isPortrait
                                    ? containerWidth * 0.2
                                    : containerWidth *
                                        0.19), //ortrait? co * 0.1 : screenWidth * 0.2), //
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
