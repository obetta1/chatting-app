



import 'package:chat_app/models/message_data.dart';
import 'package:chat_app/wiget/glowing_icon.dart';
import 'package:chat_app/wiget/wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../wiget/icon_button.dart';

class ChatScreen extends StatelessWidget {
  
  static Route route(MessageData data) => MaterialPageRoute(
    builder: (context) =>ChatScreen(messageData: data)
    );
  
   ChatScreen({
    super.key, 
    required this.messageData
    });

final ValueNotifier<String> pagetitle = ValueNotifier('messaging');

  final MessageData messageData;


  @override
  Widget build(BuildContext context) {

      pagetitle.value =messageData.senderName;


    return  Scaffold(
            appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
          title: ValueListenableBuilder(
            valueListenable: pagetitle, 
            builder: (BuildContext context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 18.0),
                   child: Align(
                    child: Avater.small(url: messageData.profilePicture)),
                 ),
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(value, 
                      style: const TextStyle(
                        fontSize: 14,
                      ),),
                      const SizedBox(
                        height: 2,
                      ),
                    const Text('online now',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),)
                    ]
                   ),
                 ),  
                ],
              );
            }),
            leading:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconBackground(
                      icon: CupertinoIcons.back, 
                      onTap: (){
                        Navigator.of(context).pop();
                      }
                      ),
                  ),
             
          actions: [
             Padding(
               padding: const EdgeInsets.all( 8.0),
               child: IconBackground(
                      icon: CupertinoIcons.video_camera, 
                      onTap: (){
                        Navigator.of(context).pop();
                      }
                      ),
             ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                       child: IconBackground(
                            icon: CupertinoIcons.phone_fill, 
                            onTap: (){
                        Navigator.of(context).pop();
                            }
                            ),
                     ),
            ],
        ),

        body: Column(
          children:  const [
            Expanded(
              child: MessageBody()
              ),
            _ActionBar()
          ],
        ),
    );
  }
}


class _ActionBar extends StatelessWidget {
  const _ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SafeArea(
        bottom: true,
        top: false,
          child: Row(
            children: [
              //this the camera icon
              Container(
                 decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),

                  child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(CupertinoIcons.camera_fill),
                  )
              ),
              
              //this is the chet test input area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left :16.0, right: 20),
                  child: TextField(
                    controller: TextEditingController(),
                     onChanged: (val) {},
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Type something...',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_){},
                  ),
                ),
              ),
              
              //this is the action biutton 
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20),
                    child: GlowingActionButton(
                      color: AppColors.accent, 
                      icon: Icons.send_rounded, 
                      onPressed: (){}
                      ),
                  ),
                
            ],
          ),
      ),
    );
  }
}
