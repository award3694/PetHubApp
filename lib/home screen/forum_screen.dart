import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'reminders.dart';

class ForumScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(
      username: 'Tom',
      funFact: 'Dogs can smell your feelings',
      content:
          'Hi everyone! My dog Max loves peanut butter, but I want to make sure it’s safe for him. Are there any brands or ingredients I should avoid?',
      image: 'assets/images/f1.png',
      userId: '6365',
      petId: '8397',
      timeAgo: '1 Day ago',
    ),
    Post(
      username: 'Tom',
      funFact: 'Dogs can smell your feelings',
      content:
          'I’m looking for new parks to take Bella for a walk. Does anyone know of dog-friendly parks in Raleigh?',
      image: 'assets/images/f2.png',
      userId: '6365',
      petId: '8397',
      timeAgo: '1 Day ago',
    ),
    Post(
      username: 'Tom',
      funFact: 'Dogs can smell your feelings',
      content:
          'My dog gets really anxious when I leave the house, even for short periods. Does anyone have tips on how to help with separation anxiety?',
      image: 'assets/images/f3.png',
      userId: '6365',
      petId: '8397',
      timeAgo: '1 Day ago',
    ),
  ];

  ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Hi, Tom"),
              Text(
                "Fun Fact: Dogs can smell your feelings",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontFamily: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                  ).fontFamily,
                ),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 8,
            bottom: 8,
            right: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: aquaGreen,
              ),
              color: aquaGreen,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              foregroundColor: Colors.black,
              radius: 40,
              backgroundColor: aquaGreen,
              backgroundImage: AssetImage(
                "assets/icons/tom.png",
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Badge(
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.red,
              label: Text(
                "2",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
              ),
              offset: const Offset(7, -5),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const ReminderScreen(),
                  );
                },
                child: const Icon(
                  Icons.notifications,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // search bar

            const SizedBox(
              height: 10,
            ),
            // Filter Buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                FilterButton(label: 'All', isSelected: true),
                SizedBox(width: 8),
                FilterButton(label: 'Recent'),
                SizedBox(width: 8),
                FilterButton(label: 'Your post'),
              ],
            ),

            const SizedBox(height: 16),

            // Posts List
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return PostCard(post: post);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Filter Button Widget
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: isSelected ? white : black,
        backgroundColor: isSelected ? orange : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

// Post Data Model
class Post {
  final String username;
  final String funFact;
  final String content;
  final String image;
  final String userId;
  final String petId;
  final String timeAgo;

  Post({
    required this.username,
    required this.funFact,
    required this.content,
    required this.image,
    required this.userId,
    required this.petId,
    required this.timeAgo,
  });
}

// Post Card Widget
class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: lighgreen,
      shape: const ContinuousRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Post Image
          if (post.image.isNotEmpty)
            Image.asset(
              post.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          // Post Info
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text('User Id: ${post.userId}'),
                const SizedBox(width: 16),
                Text('Pet Id: ${post.petId}'),
                const Spacer(),
                Text(post.timeAgo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
