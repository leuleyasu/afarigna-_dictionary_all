import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

import 'Provider/dark_theme_provider.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      color: Colors.lightBlueAccent.shade200,
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
          ),
          Text(
            "qafarafih Baritthoh App",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "ዓፋርአፉህ በሪቲቶህ አፕ",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          Text(
            "የዓፋር ቋንቋ መማሪያ መተግበሪያ",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          ListTileSwitch(
            value: themeChange.darkTheme,
            // leading: Icon(),
            onChanged: (value) {
              setState(() {
                themeChange.darkTheme = value;
              });
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.indigo,
            title: Text('Dark theme'),
          ),
        ],
      ),
    );
  }
}
