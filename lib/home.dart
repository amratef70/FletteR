import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("  فحص الشبكات اللاسلكية", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),

        body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(

                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [












                  ],
                ),
              ),

            ],

        ),

        );
  }
}