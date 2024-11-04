// import 'package:dgseaagent/pg.dart';
// import 'package:dgseaagent/view/screen/auth/login_screen.dart';
// import 'package:dgseaagent/view/screen/booking/booking_details_screen.dart';
// import 'package:dgseaagent/view/screen/booking/booking_list_screen.dart';
// import 'package:dgseaagent/view/screen/booking/fare_summary_screen.dart';
// import 'package:dgseaagent/view/screen/booking/inquiry_screen.dart';
// import 'package:dgseaagent/view/screen/booking/seat_selection_screen.dart';
// import 'package:dgseaagent/view/screen/my_profile/change_password_screen.dart';
// import 'package:dgseaagent/view/screen/my_profile/my_profile_dashboard_screen.dart';
// import 'package:get/get.dart';

// import '../../view/screen/auth/dummy_reg_form.dart';
// import '../../view/screen/auth/otp_screen.dart';
// import '../../view/screen/auth/reset_password_screen.dart';
// import '../../view/screen/booking/add_passanger_screen.dart';
// import '../../view/screen/booking/booking_dashboard_screen.dart';
// import '../../view/screen/booking/ferry_selection_screen.dart';
// import '../../view/screen/dashboard/dashboard_screen.dart';
// import '../../view/screen/wallet/wallet_dashboard_screen.dart';
// import 'controller_binding.dart';
// import 'routes_name.dart';

import 'package:apnu_umreth/Controller/Bindings/Controller_binding.dart';
import 'package:apnu_umreth/Controller/Bindings/Routes_name.dart';
import 'package:apnu_umreth/View/authentigation/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../View/authentigation/signup_page.dart';

class GetRoutes {
  List<GetPage> generateRoutes() {
    return <GetPage<dynamic>>[
      GetPage(
          name: RoutesName.kLoginScreen,
          page: () => LoginPage(),
          binding: ControllerBinding()),
      GetPage(
          name: RoutesName.kSigninScreen,
          page: () => RegisterPage(),
          binding: ControllerBinding()),
      // GetPage(name: RoutesName.kLoginScreen, page: () => const PgTest(), binding: ControllerBinding()),
    ];
  }
}
