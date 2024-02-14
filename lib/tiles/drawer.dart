import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/products");
            },
            child: const ListTile(
              leading: Icon(Icons.add_business),
              title: Text("Products"),
            )),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/orders");
            },
            child: const ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Orders"),
            )),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/management");
            },
            child: const ListTile(
              leading: Icon(Icons.edit),
              title: Text("manage products"),
            ))
      ],
    );
  }
}
