// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors

import 'package:basic_ui/pages/home.dart';
import 'package:basic_ui/pages/login.dart';
import 'package:flutter/material.dart';

class boxWidget extends StatelessWidget {
  boxWidget({super.key, this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Color.fromARGB(255, 223, 222, 222),
            )
          ]),
      child: Center(child: Text(text ?? '')),
    );
  }
}

class buttonCard extends StatelessWidget {
  buttonCard({super.key, this.text, this.callback});
  String? text;
  void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Color.fromARGB(255, 223, 222, 222),
            )
          ]),
      child: Center(
        child: GestureDetector(
          onTap: callback ?? () {},
          child: Container(
            width: 180,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              text ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
          ),
        ),
      ),
    );
  }
}

class bottomNav extends StatefulWidget {
  bottomNav({super.key, this.currentIndex, this.initialRoute});
  int? currentIndex;
  String? initialRoute;

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login")
      ],
      currentIndex: widget.currentIndex ?? 0,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
          if (widget.currentIndex == 0 && widget.initialRoute != "home") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (widget.currentIndex == 1 &&
              widget.initialRoute != "login") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        });
      },
    );
  }
}
