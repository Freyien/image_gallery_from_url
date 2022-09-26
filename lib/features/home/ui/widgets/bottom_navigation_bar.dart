part of 'package:image_gallery_from_url/features/home/ui/home_page.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload_outlined),
              label: 'Subir Imagen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library_outlined),
              label: 'Galería',
            ),
          ],
          currentIndex: state.homeEntity.tabIndex,
          onTap: (index) {
            final bloc = context.read<HomeBloc>();
            bloc.add(ChangeTabEvent(index));
          },
        );
      },
    );
  }
}
