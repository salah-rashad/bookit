import 'package:bookit/screens/days/Day.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _children2 = [
    Day(
      from: '',
      to: '',
      state: 'مغلق',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
    Day(
      from: 'الى : 8 مساءً',
      to: 'من : 8 صباحاً',
      state: 'مفتوح',
    ),
  ];
  int _selectedIndex = 0;

  List<String> _days = ['ج', 'خ', 'ع', 'ث', 'ن', ' ح', 'س'];

  Widget _buildDay(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: CircleAvatar(
          backgroundColor:
              _selectedIndex == index ? Colors.teal : Colors.transparent,
//          radius: 50,
          child: Text(_days[index],
              textDirection: TextDirection.rtl,
              softWrap: true,
              style: TextStyle(
                fontFamily: 'font1',
                color: Colors.white,
                fontSize: 16,
              )),
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
              color: darkBlue,
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: -34)
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _days
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildDay(map.key),
                )
                .toList(),
          ),
          decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 12,
                    offset: Offset(0, 8),
                    spreadRadius: -30)
              ]),
        ),
        Container(
          height: 168,
          child: SingleChildScrollView(
            key: PageStorageKey<int>(_selectedIndex),
            child:
                PageStorage(bucket: bucket, child: _children2[_selectedIndex]),
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    );
  }
}
