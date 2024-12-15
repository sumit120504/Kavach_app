import 'package:flutter/material.dart';
import 'package:kavach/pages/profile.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kavach/pages/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 202, 111, 128),
        indicatorColor: Color.fromARGB(255, 255, 213, 218),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.place),
            label: 'LOCATION',
          ),
          NavigationDestination(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Scaffold(
          appBar: AppBar(
            // leading: const NavigationDrawer(children: Text("Sumit")),
            title: const Text(
              "KAVACH",
              style: TextStyle(
                  fontFamily: "Rowdies",
                  color: Color.fromARGB(255, 202, 111, 128)),
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffF7F8F8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.person_2),
                ),
              ),
            ],
          ),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: const Color.fromARGB(255, 255, 248, 247),
    //       leading: GestureDetector(
    //         onTap: () {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(builder: (context) => const LoginPage()),
    //           );
    //         },
    //         child: Container(
    //           margin: const EdgeInsets.all(10),
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //               color: const Color(0xffF7F8F8),
    //               borderRadius: BorderRadius.circular(10)),
    //           child: SvgPicture.asset(
    //             "assets/left-arrow-svgrepo-com.svg",
    //             height: 25,
    //             width: 25,
    //           ),
    //         ),
    //       ),
    //       title: const Text(
    //         "KAVACH",
    //         style: TextStyle(
    //             fontFamily: "Rowdies",
    //             color: Color.fromARGB(255, 202, 111, 128)),
    //       ),
    //       centerTitle: true,
    //     ),
    //     body: const Padding(
    //       padding: EdgeInsets.all(40),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Text(
    //             "        Welcome my friend!!",
    //             style: TextStyle(fontFamily: "Rowdies", fontSize: 20),
    //           )
    //         ],
    //       ),
    //     ));
  }
}
