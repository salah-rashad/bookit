import 'package:bookit/consts/categories.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/ui/route_names.dart';
import 'package:bookit/widgets/categoriesList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

TextEditingController searchController = new TextEditingController();
String search;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex2;
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _children = [
    Category(
      name: 'د / أسماء مجدى لورق العنب',
      category: categoryClinic,
      ratings: '5/5',
    ),
    Category(
      name: 'محمد غانم للتصوير',
      category: categoryRestaurant,
      ratings: '4.9/5',
    ),
    Category(
      name: 'الحاج متولى جدا',
      category: categoryGarage,
      ratings: '4.3/5',
    ),
    Category(
      name: 'تيكى - Tiki',
      category: categoryCenter,
      ratings: '4.6/5',
    ),
    Category(
      name: 'صلاح رشاد الشبح',
      category: categoryHall,
      ratings: '4.8/5',
    ),
    Category(
      name: 'البرنس أحمد المحلاوى',
      category: categorySalon,
      ratings: '4.8/5',
    ),
  ];

  void _onItemTapped(int index2) {
    setState(() {
      _selectedIndex2 = index2;
    });
    if (_selectedIndex2 == 2) {
      Navigator.of(context).pushNamed(SettingsViewRoute);
    } else if (_selectedIndex2 == 0) {
      Navigator.of(context).pushNamed('/Chat');
    } else {
      Navigator.of(context);
    }
  }

//  int _currentTap = 0;
  List<String> _icons = [
    'عيادات',
    'مطاعم',
    'جراجات',
    'سنترز',
    'قاعات أفراح',
    'صالونات حلاقة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 174.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, bottom: 16.0, right: 16.0, left: 16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 48,
                              width: 240,
                              decoration: BoxDecoration(
                                color: offWhite,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkBlue.withOpacity(0.16),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: TextField(
                                  style:
                                      AppTextStyle(color: darkBlue, size: 14.0)
                                          .semiBold(),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    icon: Image.asset(
                                      "images/search.png",
                                      height: 35.0,
                                      width: 35.0,
                                    ),
                                    border: InputBorder.none,
                                    hintText: ('بحث'),
                                    hintStyle: AppTextStyle(
                                      color: grey1,
                                      size: 18.0,
                                    ).bold(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Container(
                              height: 48.0,
                              width: 48.0,
                              decoration: BoxDecoration(
                                color: offWhite,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkBlue.withOpacity(0.16),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: InkWell(
                                radius: 50,
                                onTap: () {
                                  Navigator.of(context).pushNamed(ProfileRoute);
                                },
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      'images/momo.jpg',
                                      fit: BoxFit.fill,
//                                      height: 20,
//                                      width:60
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: 70.0,
                        child: ListView.separated(
                          padding: EdgeInsets.all(16.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: _icons.length,
                          itemBuilder: (context, i) => _buildIcon(i),
                          separatorBuilder: (context, i) {
                            return SizedBox(width: 12.0);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  key: PageStorageKey<int>(_selectedIndex),
                  child: PageStorage(
                    bucket: bucket,
                    child: _children[_selectedIndex],
                  ),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: offWhite,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/chats_off.png",
              height: 32.0,
              width: 32.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/home_on.png",
              height: 45.0,
              width: 45.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/settings_off.png",
              height: 32.0,
              width: 32.0,
            ),
            title: SizedBox.shrink(),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: awesome,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Container(
//        padding: EdgeInsets.only(right: 40),
        child: SpeedDial(
          overlayColor: white,
          backgroundColor: awesome,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(color: darkBlue, size: 26),
          tooltip: 'Menu',
          curve: Curves.fastLinearToSlowEaseIn,
          children: [
            SpeedDialChild(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'images/bookings_list.png',
                    fit: BoxFit.scaleDown,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                labelBackgroundColor: awesome,
                label: 'طابور الانتظار',
                backgroundColor: Colors.white,
                labelStyle:
                    TextStyle(color: Colors.white, fontFamily: 'font1')),
            SpeedDialChild(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'images/fav_on.png',
                  ),
                ),
                labelBackgroundColor: awesome,
                label: 'المفضلة',
                backgroundColor: Colors.white,
                labelStyle:
                    TextStyle(color: Colors.white, fontFamily: 'font1')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildIcon(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 38.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            _icons[index],
            textDirection: TextDirection.rtl,
            softWrap: true,
            style: AppTextStyle(color: darkBlue, size: 14.0).bold(),
          ),
        ),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? awesome : grey1,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: darkBlue.withOpacity(0.16),
              blurRadius: 20,
              offset: Offset(0, 4),
            )
          ],
        ),
      ),
    );
  }
}
