import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: const [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(width: 18),
                Text('CookingUp'),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 30),
            title: Text('Meals'),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 30),
            title: Text('Filters'),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
