
import 'package:flutter/material.dart';


const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = DemoUsers(
  id: 'gordon',
  name: 'Gordon Hayes',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSalvatore = DemoUsers(
  id: 'salvatore',
  name: 'Salvatore Giordano',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = DemoUsers(
  id: 'sacha',
  name: 'Sacha Arbonel',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userDeven = DemoUsers(
  id: 'deven',
  name: 'Deven Joshi',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSahil = DemoUsers(
  id: 'sahil',
  name: 'Sahil Kumar',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userReuben = DemoUsers(
  id: 'reuben',
  name: 'Reuben Turner',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userNash = DemoUsers(
  id: 'nash',
  name: 'Nash Ramdial',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);


@immutable
class DemoUsers {

const DemoUsers({
  required this.id, 
  required this.name, 
  required this.image,
  });

   final String id;
  final String name;
  final String image;

}