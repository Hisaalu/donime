import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60, // Set drawer width to 70% of screen width
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.80, // Set drawer height to 75% of screen height
        ),
      child: Drawer(
        //height: MediaQuery.of(context).size.height * 0.20, // Adjust height to 75% of screen height
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile icon
                  CircleAvatar(
                    radius: 40, // Size of the profile icon
                    backgroundImage: AssetImage('assets/logo.png'), // Profile image
                    backgroundColor: Colors.white, // Background color
                  ),
                  SizedBox(height: 10),
                  // Text below the profile icon
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Dashboard'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About us'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(Icons.border_color),
              title: const Text('Refer'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () async {
                  // Sign out from Firebase
                  await FirebaseAuth.instance.signOut();
                  // Redirect to login page (replace this with your login screen)
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, 'SignInScreen'); 
                },
            ),
          ],
        ),
      )
      )
    );
  }
}