
import 'package:chat_app/app.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main(){
  final client = StreamChatClient(streemKey);
  runApp(ChatApp(client: client,));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key, required this.client});

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.dark,
      builder: (context, child){
        return StreamChatCore(
          client: client,
          child: child!
          );
      },
      home: const SelectUserScreen()
    );
  }
}

