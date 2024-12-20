import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'How often should I groom my dog or cat?',
        'answer':
            'Dogs and cats should be groomed at least once a week. Long-haired breeds may require grooming every few days to prevent matting.'
      },
      {
        'question': 'What are the signs that my pet is sick?',
        'answer':
            'Signs include changes in appetite, vomiting, diarrhea, lethargy, unusual behavior, or difficulty breathing. Consult a vet if you notice these symptoms.'
      },
      {
        'question': 'How can I keep my pet active indoors?',
        'answer':
            'Provide toys, engage in play sessions, and use puzzle feeders to keep your pet mentally and physically stimulated indoors.'
      },
      {
        'question': 'What is the best diet for my dog or cat?',
        'answer':
            'A balanced diet with high-quality protein is essential. Consult your veterinarian for specific dietary recommendations based on your pet’s age, breed, and health.'
      },
      {
        'question': 'How often should I take my pet to the vet?',
        'answer':
            'Routine check-ups are recommended annually. Puppies, kittens, and senior pets may need more frequent visits.'
      },
      {
        'question': 'What vaccines are essential for my pet?',
        'answer':
            'Core vaccines for dogs include rabies, distemper, and parvovirus. For cats, rabies and feline distemper are crucial. Your vet can provide a detailed schedule.'
      },
      {
        'question': 'Why is my pet shedding excessively?',
        'answer':
            'Excessive shedding can be due to stress, allergies, poor diet, or seasonal changes. Brush your pet regularly and consult your vet if shedding persists.'
      },
      {
        'question': 'How do I train my dog to stop barking unnecessarily?',
        'answer':
            'Use positive reinforcement to reward good behavior and redirect barking with commands or toys. Consistency is key during training.'
      },
      {
        'question': 'Why does my cat knead with its paws?',
        'answer':
            'Kneading is a comforting behavior cats often exhibit. It’s a sign of happiness or a way to mark territory through scent glands in their paws.'
      },
      {
        'question': 'Can I brush my pet’s teeth at home?',
        'answer':
            'Yes, use pet-safe toothpaste and a soft toothbrush. Brushing 2-3 times a week can help prevent dental issues.'
      },
    ];

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
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
                alignment: Alignment.topCenter,
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
                        padding: const EdgeInsets.only(
                          bottom: 20.0,
                          right: 35,
                        ),
                        child: Text(
                          "FAQs",
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

            // FAQs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: faqs.map((faq) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 1,
                    child: ExpansionTile(
                      backgroundColor: lighgreen,
                      collapsedIconColor: orange,
                      iconColor: aquaGreen,
                      title: Text(
                        faq['question']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                          ).fontFamily,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            faq['answer']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
