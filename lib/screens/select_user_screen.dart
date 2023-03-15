


import 'package:chat_app/app.dart';
import 'package:chat_app/models/demo_users.dart';
import 'package:chat_app/wiget/wiget.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'home_screen.dart';

class SelectUserScreen extends StatefulWidget {
static Route get route => MaterialPageRoute(
  builder: (context) => const SelectUserScreen(),
);

  const SelectUserScreen({super.key});

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  bool _isloading = false;

  Future<void> onUserSelected(DemoUsers users) async {
    setState(() {
      _isloading = true;
    });

    try {
      final client = StreamChatCore.of(context).client;
      await client.connectUser(
        User(
          id: users.id,
          extraData: {
            'name' : users.name,
            'image' :users.image
          }
          ), client.devToken(users.id).rawValue
        );

        //navigate to the home screen if connection is successful
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
          );
    } on Exception catch (e, st) {
      logger.e("Could not connect user", e, st);
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:(_isloading)? const CircularProgressIndicator() 
        :Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  'Select a user',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 0.4
                  ),
                ),
              ),
        
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index){
                    return SelectUserButton(
                      user: users[index],
                      onPressed: onUserSelected
                    );
                  }
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class SelectUserButton extends StatelessWidget {
  const SelectUserButton({
  Key? key,
  required this.user, 
  required this.onPressed, 
  }):super(key : key);

final DemoUsers user;
final Function(DemoUsers users) onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: ()=>onPressed(user),
        child: Row(
          children: [
            Avater.large(
              url: user.image
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 16
                  ),
                ),
              )
      
          ],
        ),
      ),
    );
  }
}