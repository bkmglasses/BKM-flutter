import 'package:flutter/material.dart';
class disFaces extends StatefulWidget {
  const disFaces({super.key});

  @override
  State<disFaces> createState() => _disFacesState();
}

class _disFacesState extends State<disFaces> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 95),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 242, 211, 1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/f1.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 242, 211, 1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/f3.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 95),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 242, 211, 1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/f2.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 242, 211, 1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/f4.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
