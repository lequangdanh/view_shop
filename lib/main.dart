import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/view/start/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //     apiKey: "AIzaSyDeEg9bc2Grfgvr-DdQnsuF-rK6gYcyDgo",
    //     authDomain: "fir-grocery-e8040.firebaseapp.com",
    //     projectId: "fir-grocery-e8040",
    //     storageBucket: "fir-grocery-e8040.appspot.com",
    //     messagingSenderId: "521149345516",
    //     appId: "1:521149345516:web:c8b5db421654969cb17fc9",
    //     measurementId: "G-YTJNT97M1D"),
  );
  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
        // initialBinding: InstanceBinding(),

        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
        }),
  );
}
