import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Map<String, String>> products = [
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
    {
      'name': 'Food Purchase',
      'date': '12/09/2024',
      'price': '\$55',
      'petID': '37878',
    },
  ];

  int selectedIndex = 0;
  final List<String> filters = ['All', 'Grooming', 'Toys'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 3),
          ),
          backgroundColor: WidgetStatePropertyAll(white),
          elevation: WidgetStatePropertyAll(0),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: orange,
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: white,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Add Expense",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
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
                        "Expense Manager",
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
          border: Border.all(
            color: isSelected ? orange : Colors.grey,
          ),
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
      margin: const EdgeInsets.symmetric(vertical: 3),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pet ID: ${product['petID']!}',
                    style: TextStyle(
                      color: orange,
                      fontSize: 10,
                      fontFamily: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ).fontFamily,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Column(
                        children: [
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
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/icons/calander.png",
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${product['date']}',
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
