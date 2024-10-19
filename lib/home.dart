import 'package:doni_me/side_menu/side_menu.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'), // Add title to the AppBar
        automaticallyImplyLeading: true, // This adds the side menu icon
        
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                     title: const Text('User Profile'),
                   ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              );
            },
          )
        ],
        //automaticallyImplyLeading: false,
      ),
      // Add the drawer to integrate the side menu
      drawer: const NavDrawer(), // This is your side menu (NavDrawer)
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
