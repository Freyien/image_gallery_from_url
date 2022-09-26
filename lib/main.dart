import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_from_url/core/domain/entities/app_colors.dart';
import 'package:image_gallery_from_url/core/ui/widgets/loading.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/app_config/ui/app_config.dart';
import 'package:image_gallery_from_url/features/home/ui/home_page.dart';
import 'package:image_gallery_from_url/features/login/ui/login_page.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init dependency injection
  await diInit();

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
      initialRoute: 'app_config',
      builder: BotToastInit(),
      routes: {
        'app_config': (_) => const AppConfigPage(),
        'login': (_) => const LoginPage(),
        'home': (_) => const HomePage()
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffold,
      ),
    );
  }
}
