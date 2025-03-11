import 'package:flutter/material.dart';

class BuildCard extends StatefulWidget {
  final String imagePath;

  const BuildCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: const Color(0xffABB0B8),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                widget.imagePath,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        child: Image.asset('assets/images/user.png', height: 25, width: 25),
                      ),
                      const SizedBox(width: 10),
                      const Text('Name', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Text(
                    'Dubai Mall-Dubai-United Arab Emirates',
                    style: TextStyle(fontSize: 13, color: Color(0xff686868), fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'Sunday 15 Jan 2023',
                    style: TextStyle(color: Color(0xff686868), fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                  const SizedBox(height: 3),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFF6D03), size: 10),
                      Text('4.5', style: TextStyle(color: Color(0xffFF6D03), fontWeight: FontWeight.w400, fontSize: 10)),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('From AED', style: TextStyle(color: Color(0xff686868), fontWeight: FontWeight.w400, fontSize: 10)),
                      Text('100', style: TextStyle(color: Color(0xff686868), fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
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
