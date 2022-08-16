import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("user logout");
    } catch (e) {
      print(e);
    }
   
  }

  @override
  Widget build(BuildContext context) {
      Future<bool> showExitPopup() async {
      return await showDialog( 
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true), 
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; 
    }
    return  WillPopScope(
        
        
 onWillPop: showExitPopup, 
         
        
    child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "القرآن الكريم",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 4, 56, 100),
        ),
        drawer: Drawer(
          width: 250,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 70, 123),
                ),
                accountName: const Text("Abdullah halari"),
                accountEmail: const Text("+92 304 2869599"),
                currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png") 
                    ),
                onDetailsPressed: () {},
              ),
              const ListTile(
                leading: Icon(Icons.bookmark),
                title: Text("Bookmarks"),
              ),
              const ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contacts us"),
              ),
              const ListTile(leading: Icon(Icons.people), title: Text("Share")),
              const ListTile(
                  leading: Icon(Icons.policy), title: Text("Privacy Policy")),
              const ListTile(
                  leading: Icon(Icons.settings), title: Text("Settings")),
              GestureDetector(
                  onTap: () {
                    signout();
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  )),
              const Divider(
                height: 40,
                thickness: 2.0,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            chat("Surah Fatiha", "verses  7", "سُوْرَۃُ الفَاتِحَة"),
            const Divider(
              height: 5,
            ),
            chat("Surah Bakarakh", "verses  286", "سُوْرَۃُ البَقَرَة"),
            const Divider(
              height: 5,
            ),
            chat("Surah Alay Imran", "verses  200", "سُوْرَۃ آلِ عِمْرَان"),
            const Divider(
              height: 5,
            ),
            chat("Surah Nisa", "verses  176", "سُوْرَۃُ النِّسَاء"),
            const Divider(
              height: 5,
            ),
            chat("Surah Maidah", "verses  120", "سُوْرَۃُ المَائِدَة"),
            const Divider(
              height: 5,
            ),
            chat("Surah Anam", "verses  165", "سُوْرَۃُ الأَنْعَام"),
            const Divider(
              height: 5,
            ),
            chat("Surah A’araf", "verses  206", "سُوْرَۃُ الأَعْرَاف"),
            const Divider(
              height: 5,
            ),
            chat("Surah Anfal", "verses  75", "سُوْرَۃُ الأَنْفَال"),
            const Divider(
              height: 5,
            ),
            chat("Surah Toba	", "verses  129", "سُوْرَۃُ التَّوْبَة"),
            const Divider(
              height: 5,
            ),
            chat("Surah Younas	", "verses  109", "سُوْرَۃ يُونُس"),
            const Divider(
              height: 5,
            ),
            chat("Surah Hud	", "verses  123", "سُوْرَۃ هُود"),
            const Divider(
              height: 5,
            ),
            chat("Surah Yousaf	", "verses  111", "سُوْرَۃ يُوسُف"),
            const Divider(
              height: 5,
            ),
          ],
        ))));
  }
}

Widget chat(name, text, time) {
  return GestureDetector( 
    onTap: () {
                    print("hello");
                  },
    child:
  ListTile(
    leading: CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.asset(
          'images/quran.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    title: Text(
      name,
      style: const TextStyle(fontSize: 20),
    ),
    subtitle: Text(text),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    ),
  ));
}
