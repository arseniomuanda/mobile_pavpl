import 'package:flutter/material.dart';
import 'package:mobile_pavpl/views/auth/login_view.dart';
import 'package:mobile_pavpl/views/auth/recover_pass_view.dart';
import 'package:mobile_pavpl/views/auth/register_view.dart';
import 'package:mobile_pavpl/views/home_view.dart';
import 'package:mobile_pavpl/views/splash_view.dart';

abstract class MRRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String passRecover = '/passRecover';


  static const String perfil = '/perfil';


  static const String cars = '/cars';
  static const String carsSeguro = '/carsSeguro';
  static const String pagamentos = '/pagamentos';
  static const String sobre = '/sobre';
  static const String contacto = '/contacto';
  static const String carSeguroProfile = '/carseguro_profile';
  static const String carProfile = '/car_profile';
  static const String servicer = '/servicer';
  static const String addCar = '/add_car_page';
  static const String carManagement = '/car_management';
  static const String store = '/store';
  static const String productProfile = '/product_profile';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String splash = '/splash';
  static const String agendarServico = '/agendar_servico';
  static const String deleteAccount = '/delete_account';
}

class MRRoute extends MRRoutes {
  Route onRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case MRRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case MRRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case MRRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case MRRoutes.passRecover:
        return MaterialPageRoute(builder: (_) => const RecoverPassPage());
      /*  case MRRoutes.agendarServico:
        return MaterialPageRoute(
          builder: (_) => AgendarServicoView(
            prestador: settings.arguments as PrestadorModel,
            agendaFacturaModel: settings.arguments as AgendaFacturaModel,
            carro: settings.arguments as CarModel,
            callBack: settings.arguments as Function(),
          ),
        );
      
      case MRRoutes.servicer:
        return MaterialPageRoute(
            builder: (_) => ServicerPage(
                  prestador: settings.arguments as PrestadorModel,
                ));
      case MRRoutes.contacto:
        return MaterialPageRoute(builder: (_) => const ContactView());
      case MRRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case MRRoutes.perfil:
        return MaterialPageRoute(builder: (_) => const PerfilView());
      case MRRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SlpashView());
      case MRRoutes.cars:
        return MaterialPageRoute(builder: (_) => const MyVehiclesView());
      case MRRoutes.carsSeguro:
        return MaterialPageRoute(builder: (_) => const MyVehiclesSeguro());
      case MRRoutes.pagamentos:
        return MaterialPageRoute(builder: (_) => const MyPaymentsView());
      case MRRoutes.sobre:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case MRRoutes.productProfile:
        return MaterialPageRoute(
          builder: (_) => ProdutoPage(
            produto: settings.arguments as ProductModel,
          ),
        );
      case MRRoutes.carProfile:
        return MaterialPageRoute(
            builder: (_) => VehicleProfileView(
                  carro: settings.arguments as CarModel,
                ));
      case MRRoutes.carSeguroProfile:
        return MaterialPageRoute(
            builder: (_) => VehicleSeguroProfileView(
                  carro: settings.arguments as CarModel,
                ));
      case MRRoutes.addCar:
        return MaterialPageRoute(builder: (_) => VehicleProfileView());
      case MRRoutes.carManagement:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<PrestadorProvider>(
                  create: (_) => PrestadorProvider()..getPrestadores(),
                  child: AppointmentView(
                    carro: settings.arguments as CarModel,
                  ),
                ));
      case MRRoutes.store:
        return MaterialPageRoute(builder: (_) => const LojaView());
      case MRRoutes.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case MRRoutes.deleteAccount:
        return MaterialPageRoute(builder: (_) => DeleteAccountScreen()); */
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
