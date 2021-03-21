// The building of the side drawer

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Test'),
                  accountEmail: Text('test@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.bcdtravel.com/move-global/wp-content/uploads/sites/142/Move_MarketMonitor_Japan_slider_May2019.jpg'
                      )),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(
                    Icons.home,
                    color:Colors.blue,
                ),
                onTap: () => Navigator.pushReplacementNamed(
                context,
                'home',
                ),
              ),
              ListTile(
                title: Text('Map'),
                leading: Icon(
                  Icons.map_outlined,
                  color:Colors.blue,
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  'map',
                ),
              ),
              ListTile(
              title: Text('Schedule'),
              leading: Icon(
                Icons.list,
                color:Colors.blue,
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  'schedule'
                ),
              ),
              ListTile(
                title: Text('Phrases'),
                leading: Icon(
                  Icons.translate,
                  color:Colors.blue,
                ),
                onTap: () => Navigator.pushNamed(
                    context,
                    'phrases'
                ),
              ),
              ListTile(
                title: Text('Guidebook'),
                leading: Icon(
                  Icons.book,
                  color:Colors.blue,
                ),
                onTap: () => Navigator.pushNamed(
                    context,
                    'guidebook'
                ),
              ),
              ListTile(
                title: Text('Photobook'),
                leading: Icon(
                  Icons.camera_alt_outlined,
                  color:Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Announcements'),
                leading: Icon(
                  Icons.announcement,
                  color: Colors.blue,
                ),
              )
        ]),)
      ),
    );
  }
}