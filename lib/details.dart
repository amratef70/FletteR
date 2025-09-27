import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.selectedNetwork != null) {
      print("DetailsPage initState: Received SSID: ${widget.selectedNetwork!.ssid}");
    } else {
      print("DetailsPage initState: No network selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedNetwork == null) {

      return Scaffold(





        appBar: AppBar(
          title: const Text("تفاصيل الشبكة"),
          backgroundColor: Colors.teal,
        ),


        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "لم يتم تحديد شبكة.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ),

      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedNetwork!.ssid.isNotEmpty ? widget.selectedNetwork!.ssid : "تفاصيل الشبكة"),
        backgroundColor: Colors.teal,
      ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

            Container(
            padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تفاصيل الشبكة:",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                  ]),

            ),






                ]
            ),


          ),

        ),


    );
  }
}
