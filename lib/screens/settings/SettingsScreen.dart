import 'package:flutter/material.dart';
import 'package:taste_khajana/models/SettingsData.dart';
import 'package:taste_khajana/screens/components/AppDrawer.dart';

class SettingsScreen extends StatefulWidget {
  static const route = '/settings';
  final SettingsData settings;
  final void Function(SettingsData data) onChanged;

  SettingsScreen(this.settings, this.onChanged);

  @override
  State createState() {
    return _SettingsScreenState(settings, onChanged);
  }
}

class _SettingsScreenState extends State {
  final SettingsData settings;
  final void Function(SettingsData data) saveSettings;

  _SettingsScreenState(settings, this.saveSettings)
      : settings = SettingsData.from(settings);

  Widget FilterSwitch(
      bool value, String title, String subtitle, Function(bool) change) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: (value) => change(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => saveSettings(settings),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            FilterSwitch(settings.onlyGlutenFree, 'Glutten Free',
                'Show only glutten free dishes', (value) {
              setState(() {
                settings.onlyGlutenFree = value;
              });
            }),
            FilterSwitch(settings.onlyLactoseFree, 'Lactose Free',
                'Show only Lactose free dishes', (value) {
              setState(() {
                settings.onlyLactoseFree = value;
              });
            }),
            FilterSwitch(
              settings.onlyIsVegan,
              'Vegetarian',
              'Show only Vegeterian dishes',
              (value) {
                setState(
                  () {
                    settings.onlyIsVegan = value;
                  },
                );
              },
            )
          ],
        ));
  }
}
