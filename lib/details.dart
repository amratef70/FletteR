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
    );
  }
}
