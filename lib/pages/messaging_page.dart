import 'package:chat_app/helper.dart';
import 'package:chat_app/models/modes.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/wiget/wiget.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
       const SliverToBoxAdapter( // Creates a sliver that contains a single box widget.
        child: Stories(),
        ),
        
        //add the vertical scrolling list
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate)
          )
         
      ],
    );
  }
  Widget _delegate(BuildContext context, int index){
    final Faker faker = Faker();
    final DateTime date = Helpers.randomDate();

    return  MessageTitle(
      messageData: MessageData(
        senderName: faker.person.name(), 
        message: faker.lorem.sentence(), 
        messageDate: date, 
        dateMessage: Jiffy(date).fromNow(), 
        profilePicture: Helpers.randomPictureUrl()
        )
      );
    }

}

class MessageTitle extends StatelessWidget {
  const MessageTitle({Key? key, required this.messageData}):super(key:key) ;

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin:const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avater.medium(url: messageData.profilePicture),
              ),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.2,
                          wordSpacing: 1.5
                        ),
                        ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textFaded
                        ),
                      ),
                      )
                  ],
                )
                ),
               
                //this is the message date and update
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(messageData.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.textFaded,
                        letterSpacing: -0.2
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('1',
                          style: TextStyle(
                            color: AppColors.cardLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),)
                          ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class Stories extends StatelessWidget {
  const Stories({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:16.0, top: 8.0, bottom: 16),
              child: Text(
                'Stories',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textFaded,
                  fontWeight: FontWeight.w900
                ),
                ),
            ),
               Expanded(
                 child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        child: _StoryCard(storyData: StoryData(
                          name: faker.person.name(), 
                          url: Helpers.randomPictureUrl()
                          ) 
                          ),
                      ),
                    );
                  } 
                  ),
               )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    super.key, 
    required this.storyData
    });

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avater.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3
              ),
            ),
          ),
        )
      ],
    );
  }
}
