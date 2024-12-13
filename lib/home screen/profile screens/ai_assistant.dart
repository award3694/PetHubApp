import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pet_hub/utils/colors.dart';

import '../../controllers/chat controller/chat_controller.dart';

class AiAssistant extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController textController = TextEditingController();

  AiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Chat With Ai',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Text(
            'Online',
            style: GoogleFonts.montserrat(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 15,
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatController.messages[index];
                    final isUserMessage = message.startsWith("You:");
                    final formattedTime = DateFormat('hh:mm a').format(
                      DateTime.now(),
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: isUserMessage
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isUserMessage)
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/icons/robot.png"),
                            ),
                          SizedBox(width: isUserMessage ? 0 : 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isUserMessage
                                    ? const Color(0xffF0FDF4)
                                    : aquaGreen,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(16),
                                  topRight: const Radius.circular(16),
                                  bottomLeft: isUserMessage
                                      ? const Radius.circular(16)
                                      : Radius.zero,
                                  bottomRight: isUserMessage
                                      ? Radius.zero
                                      : const Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message,
                                    style: TextStyle(
                                      color: isUserMessage
                                          ? Colors.black87
                                          : Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      formattedTime, // Placeholder timestamp
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isUserMessage
                                            ? Colors.grey.shade600
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: isUserMessage ? 8 : 0),
                          if (isUserMessage)
                            CircleAvatar(
                              backgroundColor: white,
                              child: Image.asset(
                                'assets/icons/tom.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message here..',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: aquaGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Image.asset(
                      "assets/icons/send.png",
                      height: 16,
                      width: 16,
                    ),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        chatController.sendMessage(textController.text);
                        textController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
