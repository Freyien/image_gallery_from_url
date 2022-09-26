part of 'package:image_gallery_from_url/features/upload/ui/upload_page.dart';

class _ImageView extends StatelessWidget {
  const _ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      builder: (context, state) {
        if (state.uploadEntity.imageList.isEmpty) {
          return const SizedBox.shrink();
        }

        final selectedIndex = state.uploadEntity.selectedIndex;
        final selectedImage = state.uploadEntity.imageList[selectedIndex];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Image.file(
            File(selectedImage.path),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
