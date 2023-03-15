

import 'dart:math';

abstract class Helpers{
  static final random = Random();
 
 //this is used to generate a radom image
  static String randomPictureUrl(){
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/200/300';
  }

  static DateTime randomDate(){
    final random = Random();
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }
}