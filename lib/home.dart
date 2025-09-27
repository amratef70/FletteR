import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        drawer: Drawer(),

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


                    Container(
                      child: Stack(
                        children: [

                          Container(
                            width: 300,
                            child: Icon(Icons.wifi, color: Colors.white, size: 60),
                          )
                        ],
                      ),
                    ),


                    ElevatedButton.icon(
                      icon: const Icon(Icons.wifi),
                      label: const Text("عرض الشبكات القريبة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NetworksPage()));
                      },
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60), backgroundColor: Colors.black45),
                    ),

                    SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset('assets/img_1.png'),
                    ),



                  ],
                ),
              ),

            ],

        ),

        );
  }
}