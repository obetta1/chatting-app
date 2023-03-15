

import 'package:chat_app/wiget/wiget.dart';
import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key, 
    });

  

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Text('YESTEDAY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textFaded,
                  fontSize: 10
                ),),
              )
              ),
          ),
        ),
      
         const OwnerMessage(message: "this is my number this isthis is my numberthis is my numberthis is my number my number", dateMessage: 'today 4:3pm',),
         const SenderMessage(message: "this is my number this is my numbthis is my numberthis is my numberthis is my numberthis is my numberer", dateMessage: 'today 4:3pm',)
        ],
      ),
    );
  }
}

class OwnerMessage extends StatelessWidget {
  const OwnerMessage({
    super.key, required this.message, 
    required this.dateMessage
    });

  final String message;
  final String dateMessage;
    final double _borderRadius =26;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0, top:10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration:  BoxDecoration(
               color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                  child: Text(
                      message,
                      style: const TextStyle(
                        color: AppColors.textLigth,
                      ),
                    ),
                
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                dateMessage,
                 style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SenderMessage extends StatelessWidget {
  const SenderMessage({
    super.key, required 
    this.message, 
    required this.dateMessage
    });

final String message;
  final String dateMessage;
  final double _borderRadius =26;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 38.0, top:10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration:  BoxDecoration(
               color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                child: Card(
                  child: Text(
                      message,
                      style: const TextStyle(
                          color: AppColors.textFaded,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dateMessage,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                  ),
              )
              )
          ],
        ),
      ),
    );;
  }
}