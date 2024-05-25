import 'package:event_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_app/auth/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    bool isAuthenticated = await Provider.of<Auth>(context, listen: false).isAuth();
    await Future.delayed(const Duration(milliseconds: 1500));
    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/evento.png'),
      ),
    );
  }

}
