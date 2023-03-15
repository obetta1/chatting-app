
import 'package:chat_app/app.dart';
import 'package:chat_app/wiget/icon_button.dart';
import 'package:chat_app/wiget/wiget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
    builder: (context) =>  HomeScreen());
    HomeScreen({Key? key}) : super(key: key);

//this is used to track when the itemis clicked
final ValueNotifier<int> pageIndex = ValueNotifier(0);
final ValueNotifier<String> pagetitle = ValueNotifier('messaging');


final pages =  const [
    MessagingPage(),
    NotificationPage(),
    CallingPage(),
    ContactPage()
  ];

  final title = const [
    'messaging',
    'notification',
    'calling',
    'contacts'
  ];

   void _onNavigationItemSelected(index){ // update the value of the pagindex on item selected
        
        pageIndex.value = index;
      }
      
  

  @override
  Widget build(BuildContext context) {
    final user = context.currentUser;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
          title: ValueListenableBuilder(
            valueListenable: pagetitle, 
            builder: (BuildContext context, value, child) {
              return Text(value);
            }),
            leadingWidth: 54,
            leading: Align(
              alignment: Alignment.centerRight,
              child: IconBackground(
                icon: Icons.search, 
                onTap: (){
                  Navigator.of(context).push(
                   ProfileScreen.route
                    );
                }
                ),
            ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Avater.small(url: user?.image,
              onTap: (){
                  Navigator.of(context).push(
                   ProfileScreen.route
                    );
                }),
              
            )
            ],
        ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex, 
        builder: (BuildContext context, int value, _) {
          return pages[value]; //swap beetween screen onclick of the item on the bottomNav
        }
        ),
      bottomNavigationBar: BottomNavBar(
        handleItemSelected: _onNavigationItemSelected,
      ),
    );
  }

 
}
