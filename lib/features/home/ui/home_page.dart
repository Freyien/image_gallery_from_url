import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/gallery/gallery_page.dart';
import 'package:image_gallery_from_url/features/upload/ui/bloc/upload_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(sl())
        ..add(
          LoadImagesEvent(),
        ),
      child: Scaffold(
        body: const SafeArea(
          child: GalleryPage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload_outlined),
              label: 'Subir Imagen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library_outlined),
              label: 'Galería',
            ),
          ],
          currentIndex: 0,
          onTap: (_) {},
        ),
      ),
    );
  }
}
