import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/gallery/gallery_page.dart';
import 'package:image_gallery_from_url/features/home/ui/bloc/home_bloc.dart';
import 'package:image_gallery_from_url/features/upload/ui/bloc/upload_bloc.dart';
import 'package:image_gallery_from_url/features/upload/ui/upload_page.dart';

part 'package:image_gallery_from_url/features/home/ui/widgets/bottom_navigation_bar.dart';
part 'package:image_gallery_from_url/features/home/ui/widgets/selected_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadBloc(sl())
            ..add(
              LoadImagesEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return const Scaffold(
          body: SafeArea(
            child: _SelectedPage(),
          ),
          bottomNavigationBar: _BottomNavigationBar(),
        );
      }),
    );
  }
}
