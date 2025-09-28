import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';


class DetailsPage extends StatefulWidget {
  final WiFiAccessPoint? selectedNetwork;
  const DetailsPage({super.key, this.selectedNetwork});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}




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

                    const SizedBox(height: 12),
                    Text("اسم الشبكة (SSID): ${widget.selectedNetwork!.ssid.isNotEmpty ? widget.selectedNetwork!.ssid : 'N/A'}", style: const TextStyle(fontSize: 16)),

                    const SizedBox(height: 8),
                    Text("BSSID: ${widget.selectedNetwork!.bssid}", style: const TextStyle(fontSize: 16)),


                    const SizedBox(height: 8),
                    Text("التردد (Frequency): ${widget.selectedNetwork!.frequency} MHz", style: const TextStyle(fontSize: 16)),

                    const SizedBox(height: 8),
                    Text("قوة الإشارة: ${widget.selectedNetwork!.level} dBm", style: const TextStyle(fontSize: 16)),

                    const SizedBox(height: 8),
                    Text("القدرات (Capabilities): ${widget.selectedNetwork!.capabilities}", style: const TextStyle(fontSize: 16)),

                    const SizedBox(height: 8),
                    Text("قياسي (Standard): ${widget.selectedNetwork!.standard}", style: const TextStyle(fontSize: 16)),

                  ]),

            ),






                ]
            ),


          ),

        ),


    );
  }
}
