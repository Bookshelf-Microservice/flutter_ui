import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  // primaryColor: primaryColor,
  // backgroundColor: kBackgroundColor,
  // scaffoldBackgroundColor: kBackgroundColor,
  // fontFamily: 'Baloo2',
  // appBarTheme: const AppBarTheme(
  //   color: kBackgroundColor,
  //   iconTheme: IconThemeData(color: darkPrimaryColor),
  //   titleTextStyle: TextStyle(
  //       color: darkPrimaryColor,
  //       fontFamily: 'Baloo2',
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold),
  //   centerTitle: true,
  //   elevation: 0.0,
  //   titleSpacing: 1,
  // ),
  // tabBarTheme: TabBarTheme(
  //   labelColor: whiteColor,
  //   labelStyle: const TextStyle(fontSize: 15, letterSpacing: 1),
  //   indicator: BoxDecoration(
  //     color: primaryColor,
  //     borderRadius: BorderRadius.circular(24),
  //   ),
  //   indicatorSize: TabBarIndicatorSize.tab,
  //   unselectedLabelColor: darkPrimaryColor,
  // ),
  // navigationBarTheme: NavigationBarThemeData(
  //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  //   height: 60.0,
  //   iconTheme: MaterialStateProperty.all(const IconThemeData(
  //     color: darkPrimaryColor,
  //   )),
  //   indicatorColor: greyColor,
  //   backgroundColor: greyColor,
  //   labelTextStyle: MaterialStateProperty.all(
  //     const TextStyle(
  //       letterSpacing: 0.0,
  //       fontSize: 10.0,
  //       color: primaryColor,
  //     ),
  //   ),
  // ),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   backgroundColor: kBackgroundColor,
  //   elevation: 3,
  //   showSelectedLabels: true,
  //   showUnselectedLabels: true,
  //   type: BottomNavigationBarType.shifting,
  //   selectedIconTheme: IconThemeData(
  //     color: primaryColor,
  //   ),
  //   selectedItemColor: primaryColor,
  //   unselectedIconTheme: IconThemeData(color: darkPrimaryColor),
  //   unselectedItemColor: darkPrimaryColor,
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        (const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textStyle: MaterialStateProperty.all(const TextStyle()),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    prefixIconColor: Colors.blue,
    fillColor: Colors.blue,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(),
    ),
  ),
);
