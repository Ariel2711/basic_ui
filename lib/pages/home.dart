// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, must_be_immutable
import 'package:basic_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String selectedValue = "Menu 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('images/logo.png'),
          title: const Text('App Title'),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Menu 1'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Menu 2'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Menu 3'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['Menu 1', 'Menu 2', 'Menu 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return boxWidget(text: "Box ${index + 1}");
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buttonCard(
                  text: "Show Dialog",
                  callback: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Judul dialog"),
                            content: Text("Isi dialog"),
                          );
                        });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                buttonCard(
                    text: "Show Snackbar",
                    callback: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Judul Snackbar"),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ),
                      ));
                    }),
                SizedBox(
                  height: 20,
                ),
                buttonCard(
                  text: "Show Bottom Sheet",
                  callback: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(color: Colors.white),
                            height: 200,
                            child: ListView(
                              children: const [
                                ListTile(
                                  title: Text("Menu 1"),
                                  leading: Icon(Icons.add),
                                ),
                                ListTile(
                                  title: Text("Menu 2"),
                                  leading: Icon(Icons.edit),
                                ),
                                ListTile(
                                  title: Text("Menu 3"),
                                  leading: Icon(Icons.search),
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNav(
          currentIndex: currentIndex,
          initialRoute: "home",
        ));
  }
}
