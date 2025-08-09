import 'package:chat_ui/screens/chat_detail.dart';
import 'package:flutter/material.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({super.key});

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  final List<Map<String, String>> _users = [
    {
      'name': 'Haley James',
      'message': 'Stand up for what you believe in',
      'message_number': '9'
    },
    {
      "name": "Nathan Scott",
      'message':
          'One day you’re seventeen and planning for someday. And then quietly and without...',
      'message_number': ''
    },
    {
      "name": "Brooke Davis",
      'message': 'I am who I am. No excuses.',
      'message_number': '2'
    },
    {
      "name": "Jamie Scott",
      'message': 'Some people are a little different. I think that’s cool.',
      'message_number': ''
    },
    {
      "name": "Marvin McFadden",
      'message':
          'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans...',
      'message_number': ''
    },
    {
      "name": "Antwon Taylor",
      'message': 'Meet me at the Rivercourt',
      'message_number': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () {}, child: const Text('Edit')),
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/edit_button.png')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ChatDetail(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            final tween = Tween(begin: begin, end: end);
                            final offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    title: Text(
                      user['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(user['message'] ?? ''),
                    trailing: (user['message_number'] ?? '').isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              user['message_number']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
