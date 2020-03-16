import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bookit/screens/categories/centers.dart';
import 'package:bookit/screens/categories/clinics.dart';
import 'package:bookit/screens/categories/garages.dart';
import 'package:bookit/screens/categories/hair_salons.dart';
import 'package:bookit/screens/categories/hospitals.dart';
import 'package:bookit/screens/categories/restaurants.dart';
import 'package:bookit/screens/categories/wedding_halls.dart';
import 'package:bookit/ui/apptheme.dart';

TextEditingController searchController = new TextEditingController();
String search;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex2 = 1;
  int _selectedIndex = 6 ;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _children = [
    Clinics(), Restaurants(),Garages(),Centers(),WeddingHalls(),HairSalons(),Hospitals()
  ];


  void _onItemTapped(int index2) {
    setState(() {
      _selectedIndex2 = index2;
    });
    if(_selectedIndex2==2){
      Navigator.of(context).pushNamed('/Settings');
    }
  }

//  int _currentTap = 0;
  List<String> _icons = [
    'عيادات', 'مطاعم', 'جراجات', 'سنترز','قاعات أفراح','صالونات حلاقة','مستشفيات'
  ];

  Widget _buildIcon(int index){

    return InkWell(
      onTap: (){
        setState(() {
          _selectedIndex = index ;
        });
      },
      child: Container(
        child:Center(
          child: Card(
            color: _selectedIndex == index ?awesome: grey1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            child:Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(_icons[index],textDirection: TextDirection.rtl,
                softWrap: true,style: TextStyle(
                    fontFamily: 'font1',color: Colors.black,fontSize: 12),
              ),
            ),
          ),
        ),
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: darkBlue,
                  blurRadius:12,
                  offset: Offset(0, 4),
                  spreadRadius: -18
              )
            ]
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomPadding: false,
      body: SafeArea(
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.only(top: 24),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20,left:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 240,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color:  darkBlue,
                                      blurRadius:40,
                                      offset: Offset(0, 4),
                                      spreadRadius: -15
                                  )
                                ]
                            ),


                            child: Padding(
                              padding: const EdgeInsets.only(left:0),
                              child: TextField(
                                style: TextStyle(fontFamily:'font1',color: Colors.black38,),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: ('ابحث هنا'),
                                    hintStyle: TextStyle(color: Colors.black38)
                                ),

                              ),
                            ),
                          ),
                          SizedBox(width: 20,),

                          Container(
                              height: 50,
                              child: InkWell(
                                radius: 50,

                                onTap: (){
                                  Navigator.of(context).pushNamed('/Profile');

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
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(right: 16,left: 16),
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Row(
                          children: _icons.asMap().entries.map(
                                (MapEntry map)=>_buildIcon(map.key),).toList()
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      key: PageStorageKey<int>(_selectedIndex),
                      child:PageStorage(bucket: bucket, child: _children[_selectedIndex]),

                      scrollDirection: Axis.vertical,
                    ),
                  ),

                ],
              ),
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline,size: 30,),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 30),
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
          overlayColor: grey1,
          backgroundColor: awesome,
          animatedIcon: AnimatedIcons.menu_close,
          tooltip: 'expand',
          curve: Curves.fastLinearToSlowEaseIn,


          children: [
            SpeedDialChild(child: ClipRRect(borderRadius: BorderRadius.circular(25),
              child: Image.asset('images/bookings_list.png'),),labelBackgroundColor: awesome,
                label: 'طابور الانتظار',backgroundColor:Colors.white,labelStyle: TextStyle(color:Colors.white,fontFamily: 'font1')),
            SpeedDialChild(child: ClipRRect(borderRadius: BorderRadius.circular(25),
              child: Image.asset('images/fav_on.png',),),labelBackgroundColor: awesome,
                label: 'المفضلة',backgroundColor: Colors.white,labelStyle: TextStyle(color:Colors.white,fontFamily: 'font1')),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}