import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BottomBar/BottomBar.dart';
import 'Util/Coffee_title.dart';
import 'Util/Coffee_Type.dart';

class Coffee extends StatefulWidget {
  Coffee({Key? key}) : super(key: key);

  @override
  State<Coffee> createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {
  //* List of Coffee Type
  final List coffeeType = [
    //* [ Coffee Type, isSelected]
    [
      "Cappucino",
      true,
    ],
    [
      "Latte",
      false,
    ],
    [
      "Black",
      false,
    ],
  ];

  //* User Tapped on coffee Types
  void CoffeeTypeSelectd(int index) {
    setState(() {
      //* this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: [
          // * Find The Best Coffee For You
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Template Coffee UI",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),
          // * Search Bar
          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find Your Coffee..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          //* Horizontal ListView of Coffee Types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          CoffeeTypeSelectd(index);
                        });
                  })),

          // * Horizontal ListView Of Coffee Litle

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTitle(
                  coffeeImagePath: "assets/images/coffee1.jpg",
                  coffeeName: "Latte",
                  coffeePrice: "4.20",
                ),
                CoffeeTitle(
                  coffeeImagePath: "assets/images/coffee2.jpg",
                  coffeeName: "Cappucino",
                  coffeePrice: "5.20",
                ),
                CoffeeTitle(
                  coffeeImagePath: "assets/images/coffee3.jpg",
                  coffeeName: "Milk Coffee",
                  coffeePrice: "9.20",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
