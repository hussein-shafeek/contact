import 'package:contact/components/app_theme.dart';
import 'package:contact/views/Contact_List_Screen.dart';
import 'package:contact/views/add_contact_screen.dart';
import 'package:contact/views/home.dart';
import 'package:contact/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:contact/components/routes.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => Contact()));
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (_) => Splashscreen(),
        AppRoutes.homeScreen: (_) => HomeScreen(),
        AppRoutes.addContactsScreen: (_) => AddContactScreen(),
        AppRoutes.contactListScreen: (_) => ContactListScreen(),
      },
      //theme: AppTheme.mainTheme,
      darkTheme: AppTheme.CustomeDarkTheme,

      themeMode: ThemeMode.dark,
    );
  }
}
