import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_chat_app/widget/widget.dart';

class Chat extends StatefulWidget {
  final String? chatRoomId;
  const Chat({super.key, this.chatRoomId});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MessageTile extends StatelessWidget {
  final String? message;
  final bool? sendByMe;
  const MessageTile({
    super.key,
    required this.message,
    required this.sendByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 8,
        right: sendByMe! ? 24 : 0,
        left: sendByMe! ? 0 : 24,
      ),
      alignment: sendByMe! ? Alignment.centerRight : Alignment.centerLeft,
      child: sendByMeContainer(sendByMe!,message!)
    );
  }
}
