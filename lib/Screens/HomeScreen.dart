import 'package:flutter/material.dart';
import 'package:senior/Screens/new_face.dart';
import 'package:senior/Screens/new_map.dart';
import 'package:senior/widget/navigation_bar.dart';
import '../widget/sign_out_option.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar:AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text('Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              backgroundColor: Color.fromARGB(255, 247, 206, 77),
              actions: [SignOutMenu(),],
            ),
            body: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(left: 30,top: 30,bottom:15,right: 30),
                      padding: EdgeInsets.all(10),
                      width: 340,
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50),
                        ),
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/p6.png'),width: 150,height: 150,),
                          SizedBox(height: 20,),
                          Text('  Location\non the map',
                            style: TextStyle(fontSize: 30,
                              color: Colors.white,

                            ),)
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.of(context).push(MaterialPageRoute
                          ( builder: (context)=> NewMap()));},
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 40,
                              top: 1
                          ),
                          padding: EdgeInsets.all(10),
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20),
                            ),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/p7.png'),width: 77,height: 70,),
                              SizedBox(height: 5,),
                              Text('Add new\n    map',
                                style: TextStyle(fontSize: 15,
                                  color: Colors.white,

                                ),)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){Navigator.of(context).push(MaterialPageRoute
                          ( builder: (context)=> NewFace()));},
                        child: Container(
                          margin: EdgeInsets.only(
                              right: 10,
                              left: 30,
                              top: 1
                          ),
                          padding: EdgeInsets.all(10),
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20),
                            ),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/p5.png'),width: 70,height:70,),
                              SizedBox(height: 5,),
                              Text('Add new\n    face',
                                style: TextStyle(fontSize: 15,
                                  color: Colors.white,

                                ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar:navigation_bar(),
            )
    );
  }
}





