import 'package:flutter/material.dart';

class PseudoSearchBar extends StatelessWidget {
  const PseudoSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(360.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Search Icon
          Icon(
            Icons.search,
            size: 30.0,
            color: Colors.black87,
            shadows: [
              Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 0.2),
            ],
          ),

          // Title and subtitles
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Qualquer lugar",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    )),
                Row(
                  // Subtitles
                  children: [
                    Text("Qualquer horário",
                        style: TextStyle(
                          color: Color.fromARGB(255, 113, 113, 113),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5),
                    ),
                    Text("•",
                        style: TextStyle(
                          color: Color.fromARGB(255, 113, 113, 113),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5),
                    ),
                    Text(
                      "Jogadores?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 113, 113),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
