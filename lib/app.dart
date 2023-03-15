import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const streemKey = "3uqfgpmpvjrg";

var logger= log.Logger();

//Extensions is used to add aditional functionality to SDK
extension StreamChatContext on BuildContext{
  //fectes the current user image
  String? get currentUserImage => StreamChatCore.of(this).currentUser?.image;

  User? get currentUser => StreamChatCore.of(this).currentUser;
}