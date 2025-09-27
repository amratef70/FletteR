import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';

class NetworksPage extends StatefulWidget {
  const NetworksPage({super.key});

  @override
  State<NetworksPage> createState() => _NetworksPageState();
}

class _NetworksPageState extends State<NetworksPage> {
  List<WiFiAccessPoint> networks = [];
  bool _isLoading = false;
  String _scanError = "";

  @override
  void initState() {
    super.initState();
    _scanNetworks();
  }

  Future<void> _scanNetworks() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _scanError = "";
      networks = []; // Clear previous results
    });


    try {
      final result = await WiFiScan.instance.getScannedResults();
      if (!mounted) return;
      setState(() {
        networks = result;
        _isLoading = false;
      });
      if (networks.isEmpty && _scanError.isEmpty) { // عرض الرسالة فقط إذا لم يكن هناك خطأ آخر
        _scanError = "لم يتم العثور على شبكات. تأكد أن Wi-Fi والموقع مفعلان.";
        setState(() {});
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {

        _scanError = "لم يتم العثور على شبكات. تأكد أن Wi-Fi والموقع مفعلان، وأن الأذونات ممنوحة.";
        _isLoading = false;
      });
    }
  }



  IconData getSignalIcon(int level) {
    if (level > -55) {
      return Icons.signal_wifi_4_bar;
    } else if (level > -75) {
      return Icons.wifi;
    } else {
      return Icons.signal_wifi_0_bar;
    }
  }




  bool _isNetworkSecured(String capabilities) {
    final securedIdentifiers = ['WEP', 'PSK', 'WPA', 'SAE', 'EAP'];
    return securedIdentifiers.any((id) => capabilities.toUpperCase().contains(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(




      appBar: AppBar(
        title: const Text("الشبكات القريبة"),
        backgroundColor: Colors.cyan,
      ),


      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _scanError.isNotEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _scanError,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      )
          : networks.isEmpty // تم تعديل هذا الشرط قليلاً
          ? Center(
        child: Text(

          _scanError.isNotEmpty ? _scanError : "لا توجد شبكات متاحة حاليًا. حاول التحديث.",
          textAlign: TextAlign.center,
        ),
      )
          : ListView.separated(
        itemCount: networks.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final net = networks[index];
          return GestureDetector(
            onTap: () {
              if (networks.isNotEmpty && index < networks.length) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(selectedNetwork: networks[index]),
                  ),
                );
              }
            },
            child: ListTile(
              leading: Icon(getSignalIcon(net.level)),
              title: Text(
                  net.ssid.isNotEmpty ? net.ssid : "شبكة مخفية"),
              subtitle: Text(
                  "BSSID: ${net.bssid} | قوة الإشارة: ${net.level} dBm"),
              trailing: _isNetworkSecured(net.capabilities)
                  ? const Icon(Icons.lock, color: Colors.grey)
                  : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanNetworks,
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}