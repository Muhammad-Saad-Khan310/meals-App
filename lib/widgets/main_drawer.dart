import 'package:delimeals/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, final VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            // Navigator.pop(context);
            // Navigator.of(context).pushNamed("/");
            Navigator.of(context).pushReplacementNamed("/");
            // Navigator.pop(context);
            // Navigator.pushNamed(context, '/sd');

            // Navigator.pushNamed(context, '/category-meals');
            // Navigator.of(context).pushReplacementNamed(
            //   '/category-meals',
            // );
          }),
          buildListTile("Filters", Icons.settings, () {
            // Navigator.pop(context);
            // Navigator.pushNamed(context, '/filters-Screen');
            Navigator.pushReplacementNamed(context, "/filters-Screen");
          }),
        ],
      ),
    );
  }
}
