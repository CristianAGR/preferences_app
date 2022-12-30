import 'package:flutter/material.dart';

import '../screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          _DrawerHeader(),
          _NewTile(text: 'Home', icon: Icon(Icons.pages_outlined), route: HomeScreen.routerName),
          _NewTile(text: 'People', icon: Icon(Icons.people_outline), route: HomeScreen.routerName),
          _NewTile(text: 'Settings', icon: Icon(Icons.settings_outlined), route: SettingsScreen.routerName),

        ],
      ),
    );
  }
}

class _NewTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final String route;

  const _NewTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.route
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route );
      },
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        )
      ),
      child:  Container(),
    );
  }
}