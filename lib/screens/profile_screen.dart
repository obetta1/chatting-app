


import 'package:chat_app/app.dart';
import 'package:chat_app/screens/select_user_screen.dart';
import 'package:chat_app/wiget/wiget.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ProfileScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
    builder: (context) => const ProfileScreen(),
    );
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final users = context.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children:  [
            Hero(
              tag: 'hero-profile-picture', 
              child: Avater.large(url: users?.image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(users?.name ?? 'No name'),
              ),
            const Divider(),
            const SignOutButton()
          ],
        ),
      ),
    );
  }
}

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
     bool _loading = false;

   Future<void> _signOut() async{
    setState(() {
      _loading = true;
    });

    try {
     await StreamChatCore.of(context).client.disconnectUser();

      Navigator.of(context).push(SelectUserScreen.route);
   
    } on Exception catch (e, st) {
       _loading = false;
       logger.e('Could not disconnect user', e, st);
    }
      
   }

  @override
  Widget build(BuildContext context) {
    return _loading ? const CircularProgressIndicator() :
     InkWell(
      child: const Padding(
        padding: EdgeInsets.all(28.0),
        child: Text('Sign Out', style: TextStyle(
          fontSize: 24,
          color: AppColors.textHighlight,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      onTap: (){
        _signOut();
      },
    );
  }
}