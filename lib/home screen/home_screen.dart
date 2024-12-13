import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/home%20screen/challenges.dart';
import 'package:pet_hub/home%20screen/gift_shop.dart';
import 'package:pet_hub/home%20screen/pet_locator.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:pet_hub/widgets/container_deals.dart';

import '../widgets/swiper_slider.dart';
import 'reminders.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> gridItems = [
    {
      'icon': "assets/icons/gift shop.png",
      'text': 'Gift Shop',
      'route': const GiftShop()
    },
    {
      'icon': "assets/icons/challenges.png",
      'text': 'Challenges',
      'route': const Challenges()
    },
    {
      'icon': "assets/icons/pet locator.png",
      'text': 'Pet Locator',
      'route': const PetLocator()
    },
  ];

  final imagePaths = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  final List<Map<String, String>> deals = [
    {
      'imagePath': 'assets/images/natual balance.png',
      'name': 'Natural Balance Cat',
    },
    {
      'imagePath': 'assets/images/smoth skin wash.png',
      'name': 'Smoothe My Skin Wash',
    },
  ];

  final List<Map<String, String>> upcomming = [
    {
      'imagePath': 'assets/images/pet expo.png',
      'title': 'Pet Expo',
      'desc': "The entire pet industry comes together for a convention"
    },
    {
      'imagePath': 'assets/images/dog beach day.png',
      'title': 'Dog Beach Day',
      'desc': "Dog lovers bring their furry friends to the beach"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
          padding: const EdgeInsets.only(left: 8.0),
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
              smallSize: 8,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ReminderScreen());
                },
                child: const Icon(
                  Icons.notifications,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 10),
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 boxes per row
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                  childAspectRatio: 1, // Box aspect ratio
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item['route']),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: lighgreen,
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['icon'].toString(),
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['text'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SwiperSlider(imagePaths: imagePaths),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deals For The Day",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w600)
                              .fontFamily,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: orange,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 3 boxes per row
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                  childAspectRatio: 0.9, // Box aspect ratio
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ContainerDeals(
                    imagePath: deals[index]['imagePath']!,
                    name: deals[index]['name']!,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Events",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w600)
                              .fontFamily,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: orange,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 3 boxes per row
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                  childAspectRatio: 0.55, // Box aspect ratio
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container2(
                    imagePath: upcomming[index]['imagePath']!,
                    title: upcomming[index]['title']!,
                    desc: upcomming[index]['desc']!,
                  );
                },
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
