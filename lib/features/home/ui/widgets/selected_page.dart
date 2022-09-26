part of 'package:image_gallery_from_url/features/home/ui/home_page.dart';

class _SelectedPage extends StatelessWidget {
  const _SelectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.homeEntity.tabIndex) {
          case 0:
            return const UploadPage();
          case 1:
            return const GalleryPage();
        }

        return SizedBox.fromSize();
      },
    );
  }
}
