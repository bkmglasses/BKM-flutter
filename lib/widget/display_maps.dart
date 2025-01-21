import 'package:flutter/material.dart';

class disMaps extends StatefulWidget {
  const disMaps({super.key});

  @override
  State<disMaps> createState() => _disMapsState();
}

class _disMapsState extends State<disMaps> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
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
                    'assets/m1.png',
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
                    'assets/m3.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1,bottom: 140),
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
                    'assets/m2.png',
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
