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
          padding: const EdgeInsets.only(top: 95),
          child:SingleChildScrollView(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: 20,
                  child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 242, 211, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image(image:
                      AssetImage('assets/m1.png'),
                        height: 200,
                        width: 200,
                      )
                  ),

                ),
                SizedBox(height: 10,),
                Positioned(
                  top: 20,
                  child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 242, 211, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image(image:
                      AssetImage('assets/m3.png'),
                        height: 200,
                        width: 200,
                      )
                  ),

                ),
              ],
            ),
          ),),
        Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child:SingleChildScrollView(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Positioned(
                    top: 20,
                    child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 242, 211, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Image(image:
                        AssetImage('assets/m2.png'),
                          height: 200,
                          width: 200,
                        )
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
