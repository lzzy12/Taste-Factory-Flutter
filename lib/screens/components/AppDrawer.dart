import 'package:flutter/material.dart';
import 'package:taste_khajana/screens/settings/SettingsScreen.dart';

import '../../models/dummy_data.dart';

class AppDrawer extends StatelessWidget {
  Widget DrawerItem(BuildContext context, String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: <Widget>[
          Image.network(
            DUMMY_FAVORITES[1].imageUrl,
            fit: BoxFit.fill,
            height: size.height / 3,
            width: double.infinity,
          ),
          DrawerItem(context, 'Meals',
              () => Navigator.of(context).pushReplacementNamed('/')),
          DrawerItem(
              context,
              'Settings',
              () => Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.route))
        ],
      ),
    );
  }
}
