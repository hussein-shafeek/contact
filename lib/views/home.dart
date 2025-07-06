import 'package:contact/components/routes.dart';
import 'package:flutter/material.dart';
import 'package:contact/components/app_layout.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isContactListEmpty = true;
    return AppLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactsScreen);
        },
        backgroundColor: const Color(0xffFFF1D4),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.090),
          Center(
            child: Lottie.asset(
              'assets/animations/empty.json',
              width: 368,
              height: 368,
              fit: BoxFit.contain,
            ),
          ),

          //Center(child: Image.asset('assets/images/listpurple.png')),
          Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFF1D4),
            ),
          ),
        ],
      ),
    );
  }
}
