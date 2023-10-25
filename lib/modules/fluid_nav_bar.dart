import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/nav_item_model.dart';

class FluidNavBar extends StatefulWidget {
  @override
  _FluidNavBarState createState() => _FluidNavBarState();
}

class _FluidNavBarState extends State<FluidNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(Icons.account_circle_outlined, "Profile"),
    NavItem(Icons.book_outlined, "Reservations"),
    NavItem(Icons.store_mall_directory_outlined, "Bitcoin"),
    NavItem(Icons.bookmark, "Bookmark"),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(

        height: 60.0,
        width: 60.0,

        child: FloatingActionButton(

          onPressed: () {},
          backgroundColor: Colors.amberAccent,


          child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.pin_drop_outlined,
                  size: 40.0,
                  color: Color(0xff2D2727)
              )
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffC4DFDF),
        shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _navItems.map((item) {
            var index = _navItems.indexOf(item);
            return Row(
              children: [
                const SizedBox(width: 10,),
                Container(
                  width: 50,
                  child: IconButton(
                    onPressed: () => _onNavItemTapped(index),
                    icon: Icon(
                      item.icon,
                      color:  Colors.white ,
                      size: 35,
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}