import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vt/authentication/email_login.dart';
import 'package:vt/Clist/Categories.dart';
import 'package:vt/data/data.dart';
import 'package:vt/screens/cartScreen.dart';
class Home extends StatelessWidget {
  Home({this.uid});
  final String? uid;
  final String title = "Poshtik";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body:Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple[50],
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        letterSpacing: 3),
                  ),
                ),
                Categories(),
              ],
            ),
          ),
        ),
       
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[500],
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,   //CHANGE THIS TO GREY ON SELECTED
        items: [
          BottomNavigationBarItem(
             icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: "Cart"),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            );
          }
          else{
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid:this.uid)),
              );
          }
        },
      ),
      appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_sharp,
                            ),
                            Text(
                              '(${cart.length})',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
    drawer: NavigateDrawer(uid: this.uid)
  );  
  }
}

class NavigateDrawer extends StatefulWidget {
  final String? uid;
  NavigateDrawer({Key? key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid!)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.value['email']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid!)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.value['name']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.exit_to_app,
                color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Log Out'),
            onTap: () {
              FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => EmailLogIn()),
                      (Route<dynamic> route) => false);
                });
            },
          ),
        ],
      ),
    );
  }
}