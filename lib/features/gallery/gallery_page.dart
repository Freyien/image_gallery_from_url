import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_gallery_from_url/features/upload/ui/bloc/upload_bloc.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      builder: (context, state) {
        final imageList = state.uploadEntity.imageList.reversed.toList();

        if (imageList.isEmpty) {
          return const SizedBox.shrink();
        }

        return GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: imageList.length.isEven
                ? [
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                  ]
                : [
                    const QuiltedGridTile(1, 2),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                  ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              final image = imageList[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(image.path),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
            childCount: imageList.length,
          ),
        );
      },
    );
  }
}
