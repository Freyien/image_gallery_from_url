import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_from_url/core/domain/entities/app_colors.dart';
import 'package:image_gallery_from_url/core/ui/widgets/loading.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/login/ui/login_page.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  // Init dependency injection
  diInit();

  runApp(const LoaderOverlay());
}

class LoaderOverlay extends StatelessWidget {
  const LoaderOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Loading(),
      overlayColor: AppColors.loadingOverlay,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      builder: BotToastInit(),
      routes: {
        'login': (_) => const LoginPage(),
        'home': (_) => const Scaffold(
              body: Center(
                child: Text('Pending'),
              ),
            ),
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
    );
  }
}
