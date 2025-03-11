import 'package:flutter/material.dart';

class BuildButtonCard extends StatefulWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const BuildButtonCard(
      {Key? key,
      required this.imagePath,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  State<BuildButtonCard> createState() => _BuildButtonCardState();
}

class _BuildButtonCardState extends State<BuildButtonCard> {
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
                height: 114,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Task Details',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Dubai Mall-Dubai-United Arab Emirates',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff686868),
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'Sunday 15 Jan 2023',
                    style: TextStyle(
                        color: Color(0xff686868),
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    onPressed: widget.onPressed,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('From AED',
                          style: TextStyle(
                              color: Color(0xff686868),
                              fontWeight: FontWeight.w400,
                              fontSize: 10)),
                      Text('100',
                          style: TextStyle(
                              color: Color(0xff686868),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
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
