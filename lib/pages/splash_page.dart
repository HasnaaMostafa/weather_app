import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'search_page.dart';


class splashPage extends StatelessWidget {
  const splashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        HexColor("#0F48EA"),
                        HexColor("#113FC1"),
                        HexColor("#041C5E"),
                        HexColor("#060F80"),
                        HexColor("#3441DD"),
                        HexColor("#1450FF"),
                        HexColor("#136FA0"),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft

                  )
              ),),
            Column(
              children: [
                const Center(
                  child: Image(image: AssetImage(
                    "assets/images/Home.png",
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Discover the Weather in your City",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  height: 20,
                ),
                const Text("Get Know your weather and forecast",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15
                ),),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: 200,
                    decoration: BoxDecoration(
                        color: HexColor("#478CCC"),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  child: TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context)=>SearchPage()));
                  },
                      child: const Text("Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ))
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
