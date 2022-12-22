import 'package:flutter/material.dart';
import 'package:untitled9/somePage.dart';
import 'package:untitled9/textwidget.dart';
import 'EventsPage.dart';
import 'Homepage.dart';
import 'NotesPage.dart';
import 'Provider/dark_theme_provider.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  void initState() {
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            // title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: HomePages(),
          );
        }));
  }
}

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashboard) {
      container = HomePage();
    } else if (currentPage == DrawerSections.contacts) {
      container = somePage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
      // } else if (currentPage == DrawerSections.settings) {
      //   container = SettingsPage();
      // } else if (currentPage == DrawerSections.notifications) {
      //   container = NotificationsPage();
      // } else if (currentPage == DrawerSections.privacy_policy) {
      //   container = PrivacyPolicyPage();
      // } else if (currentPage == DrawerSections.send_feedback) {
      //   container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade200,
        title: Text("የዓፋርኛ ቋንቋ መማሪያ"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Qangooru-ዓንጎሩ-ቃላቶች", Icons.home,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "walala-ወለላ-ውይይቶች", Icons.person,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "የተመረጡ", Icons.favorite,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "yabti-rakiibo-ያብቲ-ረኪቦ-ሰዋሰው", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "About", Icons.info,
              currentPage == DrawerSections.settings ? true : false),

          // menuItem(6, "Notifications", Icons.notifications_outlined,
          //     currentPage == DrawerSections.notifications ? true : false),
          Divider(),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
