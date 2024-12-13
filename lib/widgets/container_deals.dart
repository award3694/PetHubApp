import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class ContainerDeals extends StatelessWidget {
  final String imagePath;
  final String name;

  const ContainerDeals({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 142,
                width: 184,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 142,
                    width: 184,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w600)
                  .fontFamily,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;

  const Container2({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 329,
      width: 184,
      decoration: BoxDecoration(
        color: lighgreen,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontFamily: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                ).fontFamily,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(orange),
                  fixedSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width,
                      30,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "View Event",
                  style: TextStyle(
                    fontSize: 14,
                    color: white,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
