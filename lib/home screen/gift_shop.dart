import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class GiftShop extends StatefulWidget {
  const GiftShop({super.key});

  @override
  State<GiftShop> createState() => _GiftShopState();
}

class _GiftShopState extends State<GiftShop> {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/smoth skin wash.png',
      'name': 'Grooming Clippers',
      'date': '25 Mar 2024',
      'brand': 'Xyz',
      'price': '\$55',
      'oldPrice': '\$65',
    },
    {
      'image': 'assets/images/gift_dog.png',
      'name': 'Grooming Clippers',
      'date': '25 Mar 2024',
      'brand': 'Xyz',
      'price': '\$55',
      'oldPrice': '\$65',
    },
    {
      'image': 'assets/images/gift_dog2.png',
      'name': 'Grooming Clippers',
      'date': '25 Mar 2024',
      'brand': 'Xyz',
      'price': '\$55',
      'oldPrice': '\$65',
    },
  ];

  int selectedIndex = 0;
  final List<String> filters = ['All', 'Grooming', 'Toys'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  // offset: Offset(5, 5),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 70,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Gift Shop",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ).fontFamily,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildSearchBar(),
          const SizedBox(height: 10),
          _buildFilterButtons(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: _buildProductCard(products[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
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
            contentPadding: const EdgeInsets.only(
              top: 10,
            ),
            prefixIcon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(filters.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: _buildFilterButton(filters[index],
              isSelected: selectedIndex == index),
        );
      }),
    );
  }

  Widget _buildFilterButton(String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: isSelected ? orange : Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? const Icon(
                    Icons.check,
                    size: 15,
                    color: orange,
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? orange : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: lighgreen,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product['image']!,
                width: 100,
                height: 157,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ).fontFamily,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Order Date: ${product['date']}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'BRAND: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ).fontFamily,
                        ),
                      ),
                      Text(
                        '${product['brand']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ).fontFamily,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        product['oldPrice']!,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product['price']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ).fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'View Website',
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
