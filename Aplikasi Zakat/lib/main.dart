import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/DataTableSample.dart';
import 'package:flutter_application_2/KalkulatorZHarta.dart';
import 'package:flutter_application_2/KalkulatorZakat.dart';
import 'package:flutter_application_2/LaporanScreen.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:flutter_application_2/zakatFitrah_2Screen.dart';
import 'package:flutter_application_2/zakatFitrah_3Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:provider/provider.dart';
import 'zakatFitrah_1Screen.dart';
import 'Dashboard.dart';
import 'RegisterScreen.dart';
import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => itemLaporan(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          //   home: (zakatFitrah_1Screen()),
          // );
          initialRoute: DashboardScreen.route,
          routes: {
            DashboardScreen.route: (context) => const DashboardScreen(),
            zakatFitrah_1Screen.route: (context) => const zakatFitrah_1Screen(),
            ZakatFitrah_2Screen.route: (context) => ZakatFitrah_2Screen(),
            zakatFitrah_3Screen.route: (context) => zakatFitrah_3Screen(),
            zakatMall_1Screen.route: (context) => const zakatMall_1Screen(),
            KalkulatorScreen.route: (context) => const KalkulatorScreen(),
            kalkulatorZHartaScreen.route: (context) =>
                const kalkulatorZHartaScreen(),
            LaporanScreen.route: (context) => const LaporanScreen(),
            DataTableSample.route: (context) => const DataTableSample(),
            AlarmScrenn.route: (context) => const AlarmScrenn(),
          }),
    );
  }
}
