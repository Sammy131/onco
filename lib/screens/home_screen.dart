import 'package:cloud_firestore/cloud_firestore.dart';
import '/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'side_nav.dart';
import 'gridinfo.dart';

//import 'signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                    //logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}*/

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   color: Colors.white,
          //   iconSize: 30,
          //   onPressed: () {
          //     if (scaffoldKey.currentState!.isDrawerOpen) {
          //       scaffoldKey.currentState!.closeDrawer();
          //       //close drawer, if drawer is open
          //     } else {
          //       scaffoldKey.currentState!.openDrawer();
          //       //open drawer, if drawer is closed
          //     }
          //   },
          // ),
          centerTitle: true,
          title: Text(
            "Antibiotica",
            style: TextStyle(
                //color: Color.fromARGB(255, 7, 20, 91),
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),

          //backgroundColor: Color.fromARGB(255, 229, 76, 4),
          backgroundColor: Colors.deepOrange,
          bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0),
          )),
      //backgroundColor: Color.fromARGB(248, 8, 38, 34),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          //const EdgeInsets.all(3.0),
          child: GridView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 2,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Tab(
                        icon: new Image.asset(
                          'assets/images/subj.png',
                          //height: 400,
                          //width: 400,
                          scale: 4,
                        ),
                      ),*/

                      //Admission Process
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/syn.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Syndromes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              //EXAM
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.book,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/exam.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/path.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Pathogens",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/grade.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/drug.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Drugs",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.money,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/fees.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/pre.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Prevention",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/result.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/hiv.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "HIV",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => info()));
                },
                child: Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.help,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/query.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/tab.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Tablets & Tools",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              //childAspectRatio: .60,
            ),
          ),
        ),
      ),
    );
  }
}
