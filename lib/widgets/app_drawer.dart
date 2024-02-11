import 'package:flutter/material.dart';
// import 'package:traveling_app/screens/taps_screen.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget newMethod(
      String title, IconData icon, Function? Function() onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          newMethod('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');

            return null;
          }),
          newMethod('الفلترة', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterScreen.screenRoute);
            return null;
          }),
        ],
      ),
    );
  }
}
