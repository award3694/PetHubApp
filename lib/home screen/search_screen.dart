import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package
import 'package:pet_hub/utils/colors.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
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
      'name': 'Dog Toy Bone',
      'date': '15 Apr 2024',
      'brand': 'Abc',
      'price': '\$20',
      'oldPrice': '\$30',
    },
    {
      'image': 'assets/images/gift_dog2.png',
      'name': 'Pet Shampoo',
      'date': '10 May 2024',
      'brand': 'PetCare',
      'price': '\$15',
      'oldPrice': '\$25',
    },
  ];

  // Controller to manage search input
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode(); // Add a focus node

  // Holds the filtered products
  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Initially, filteredProducts is empty
    filteredProducts = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        // Clear filtered products when search is empty
        filteredProducts = [];
      } else {
        // Filter products by name or brand
        filteredProducts = products
            .where((product) =>
                product['name']!.toLowerCase().contains(query.toLowerCase()) ||
                product['brand']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
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
                        "Search", // Updated header title
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
          // Search Bar Section
          _buildSearchBar(),
          const SizedBox(height: 10),
          // Product List Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: filteredProducts.isEmpty
                  ? Center(
                      child: Lottie.asset(
                        'assets/icons/search.json', // Lottie animation path
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: _buildProductCard(filteredProducts[index]),
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
          controller: _searchController,
          onChanged: _filterProducts, // Call the filter function on text change
          focusNode: _searchFocusNode, // Attach the focus node
          decoration: InputDecoration(
            hintText: "Search by name or brand",
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 10),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: lighgreen,
        border: Border.all(color: Colors.grey.shade300),
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
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Order Date: ${product['date']}',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'BRAND: ',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product['brand']!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
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
                        style: GoogleFonts.montserrat(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product['price']!,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'View Website',
                      style: GoogleFonts.montserrat(color: white),
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
