part of 'package:image_gallery_from_url/features/upload/ui/upload_page.dart';

class _ImagePreviewList extends StatelessWidget {
  const _ImagePreviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      builder: (context, state) {
        final uploadEntity = state.uploadEntity;

        // Empty
        if (uploadEntity.imageList.isEmpty) {
          return const SizedBox.shrink();
        }

        // Image list
        return Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(builder: (context, constraints) {
            final imageWidht =
                constraints.maxWidth / uploadEntity.maxImageLenght;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                uploadEntity.imageList.length,
                (index) {
                  // Image card
                  return _ImageCard(
                    imageList: uploadEntity.imageList,
                    imageWidht: imageWidht,
                    index: index,
                    isSelectedImage: index == uploadEntity.selectedIndex,
                  );
                },
              ),
            );
          }),
        );
      },
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    Key? key,
    required this.index,
    required this.isSelectedImage,
    required this.imageList,
    required this.imageWidht,
  }) : super(key: key);

  final int index;
  final bool isSelectedImage;
  final List<ImageEntity> imageList;
  final double imageWidht;

  @override
  Widget build(BuildContext context) {
    final color = isSelectedImage //
        ? AppColors.primary
        : Colors.transparent;

    final image = imageList[index];

    return Column(
      children: [
        // Image
        InkWell(
          onTap: () {
            final bloc = context.read<UploadBloc>();
            bloc.add(ChangeSelectedImageEvent(index));
          },
          child: Container(
            width: imageWidht,
            padding: const EdgeInsets.all(5),
            color: color,
            child: Column(
              children: [
                Image.file(
                  File(image.path),
                  width: imageWidht,
                  height: imageWidht,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),

        // Delete button
        if (isSelectedImage)
          CircleIconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext dialogContext) => _DeleteAlert(
                  image: image,
                  context: context,
                ),
              );
            },
            icon: Icon(
              Icons.highlight_remove,
              color: AppColors.danger,
            ),
          ),
      ],
    );
  }
}
