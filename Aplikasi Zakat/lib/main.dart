import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/DataTableSample.dart';
import 'package:flutter_application_2/KalkulatorZHarta.dart';
import 'package:flutter_application_2/KalkulatorZakat.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatEmas.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatFidyah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatHadiah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPenghasilan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerak.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerniagaan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatTabungan.dart';
import 'package:flutter_application_2/LaporanScreen.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:flutter_application_2/zakatFitrah_2Screen.dart';
import 'package:flutter_application_2/zakatFitrah_3Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:flutter_application_2/zakatMall_2Screen%20copy.dart';
import 'package:flutter_application_2/zakatMall_3Screen%20.dart';

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
            ZakatMall_2Screen.route: (context) => ZakatMall_2Screen(),
            zakatMall_3Screen.route: (context) => zakatMall_3Screen(),
            KalkulatorScreen.route: (context) => const KalkulatorScreen(),
            kalkulatorZPendapatanScreen.route: (context) =>
                const kalkulatorZPendapatanScreen(),
            kalkulatorZTabunganScreen.route: (context) =>
                const kalkulatorZTabunganScreen(),
            kalkulatorZPerniagaanScreen.route: (context) =>
                const kalkulatorZPerniagaanScreen(),
            kalkulatorZEmasScreen.route: (context) =>
                const kalkulatorZEmasScreen(),
            kalkulatorZPerakScreen.route: (context) =>
                const kalkulatorZPerakScreen(),
            kalkulatorZHadiahScreen.route: (context) =>
                const kalkulatorZHadiahScreen(),
            kalkulatorZFidyahScreen.route: (context) =>
                const kalkulatorZFidyahScreen(),
            LaporanScreen.route: (context) => const LaporanScreen(),
            DataTableSample.route: (context) => const DataTableSample(),
            AlarmScrenn.route: (context) => const AlarmScrenn(),
          }),
    );
  }
}
