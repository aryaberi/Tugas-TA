import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/Bantuan_Page/Alarm.dart';
import 'package:flutter_application_2/Bantuan_Page/Belajar.dart';
import 'package:flutter_application_2/Bantuan_Page/Kalkulator.dart';
import 'package:flutter_application_2/Bantuan_Page/Laporan.dart';
import 'package:flutter_application_2/Bantuan_Page/bayarZakatFitrah.dart';
import 'package:flutter_application_2/Bantuan_Page/bayarZakatMal.dart';
import 'package:flutter_application_2/Belajar_Page/jenisZakat.dart';
import 'package:flutter_application_2/JenisZakat.dart';
import 'package:flutter_application_2/Provider/User.dart';
import 'package:flutter_application_2/Provider/itemLaporan2.dart';
import 'package:flutter_application_2/Transisi.dart';
import 'package:flutter_application_2/belajarZakat.dart';
import 'package:flutter_application_2/Bantuan.dart';
import 'package:flutter_application_2/Belajar_Page/Hukuman.dart';
import 'package:flutter_application_2/Belajar_Page/WajibZakat.dart';
import 'package:flutter_application_2/Belajar_Page/ZakatOnline.dart';
import 'package:flutter_application_2/Belajar_Page/pengertianZakat.dart';
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
import 'package:flutter_application_2/Provider/User.dart';
import 'package:flutter_application_2/zakatFitrah_2Screen.dart';
import 'package:flutter_application_2/zakatFitrah_3Screen.dart';
import 'package:flutter_application_2/zakatFitrah_4Screen%20.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:flutter_application_2/zakatMall_2Screen%20copy.dart';
import 'package:flutter_application_2/zakatMall_3Screen%20.dart';

import 'package:provider/provider.dart';
import 'Provider/listBayar.dart';
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
        create: (context) => itemLaporan2(),
        child: ChangeNotifierProvider(
          create: (context) => dataUser(),
          child: ChangeNotifierProvider(
            create: (context) => itemLaporan(),
            child: ChangeNotifierProvider(
              create: (context) => listBayar(),
              child: MaterialApp(
                  title: 'ZOI',
                  theme: ThemeData(fontFamily: 'OpenSans'),
                  debugShowCheckedModeBanner: false,
                  //   home: (zakatFitrah_1Screen()),
                  // );
                  initialRoute: LoginScreen.route,
                  routes: {
                    // route Menu Dashboard//
                    LoginScreen.route: (context) => const LoginScreen(),
                    RegisterScreen.route: (context) => const RegisterScreen(),
                    DashboardScreen.route: (context) => const DashboardScreen(),
                    TransisiScreen.route: (context) => const TransisiScreen(),
                    zakatFitrah_1Screen.route: (context) =>
                        const zakatFitrah_1Screen(),
                    zakatMall_1Screen.route: (context) =>
                        const zakatMall_1Screen(),
                    KalkulatorScreen.route: (context) =>
                        const KalkulatorScreen(),
                    LaporanScreen.route: (context) => const LaporanScreen(),
                    DataTableSample.route: (context) => const DataTableSample(),
                    AlarmScrenn.route: (context) => const AlarmScrenn(),
                    BelajarScreen.route: (context) => const BelajarScreen(),
                    BantuanScreen.route: (context) => const BantuanScreen(),

                    //route Zakat fitrah//
                    ZakatFitrah_2Screen.route: (context) =>
                        ZakatFitrah_2Screen(),
                    zakatFitrah_3Screen.route: (context) =>
                        zakatFitrah_3Screen(),
                    zakatFitrah_4Screen.route: (context) =>
                        zakatFitrah_4Screen(),

                    //route Zakat Mall//
                    ZakatMall_2Screen.route: (context) => ZakatMall_2Screen(),
                    zakatMall_3Screen.route: (context) => zakatMall_3Screen(),

                    //route Kalkulator//
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

                    //route Belajar//
                    pengertianScreen.route: (context) =>
                        const pengertianScreen(),
                    jenisZakatScreen.route: (context) =>
                        const JenisZakatScreen(),
                    WajibScreen.route: (context) => const WajibScreen(),
                    HukumanScreen.route: (context) => const HukumanScreen(),
                    zakatOnlineScreen.route: (context) =>
                        const zakatOnlineScreen(),

                    //route bantuan//
                    bantuanKalulatorScreen.route: (context) =>
                        const bantuanKalulatorScreen(),
                    bantuanLaporanScreen.route: (context) =>
                        const bantuanLaporanScreen(),
                    bantuanAlarmScreen.route: (context) =>
                        const bantuanAlarmScreen(),
                    bantuanBelajarScreen.route: (context) =>
                        const bantuanBelajarScreen(),
                    bantuanZMScreen.route: (context) => const bantuanZMScreen(),
                    bantuanZFScreen.route: (context) => const bantuanZFScreen(),
                  }),
            ),
          ),
        ));
  }
}
