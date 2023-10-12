// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, must_be_immutable
import 'package:basic_ui/pages/login.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login")
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (currentIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            }
          });
        },
      ),
    );
  }
}

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
