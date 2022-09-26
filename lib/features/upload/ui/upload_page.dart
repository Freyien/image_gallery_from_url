import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/core/domain/entities/app_colors.dart';
import 'package:image_gallery_from_url/core/ui/utils/keyboard.dart';
import 'package:image_gallery_from_url/core/ui/utils/toast.dart';
import 'package:image_gallery_from_url/core/ui/widgets/circle_icon_button.dart';
import 'package:image_gallery_from_url/core/ui/widgets/input_text.dart';
import 'package:image_gallery_from_url/core/ui/widgets/primary_button.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/upload/domain/entities/entities.dart';
import 'package:image_gallery_from_url/features/upload/ui/bloc/upload_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

part 'package:image_gallery_from_url/features/upload/ui/widgets/delete_alert.dart';
part 'package:image_gallery_from_url/features/upload/ui/widgets/image_preview_list.dart';
part 'package:image_gallery_from_url/features/upload/ui/widgets/image_view.dart';
part 'package:image_gallery_from_url/features/upload/ui/widgets/search_bar.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(sl())
        ..add(
          LoadImagesEvent(),
        ),
      child: BlocListener<UploadBloc, UploadState>(
        listener: _uploadListener,
        child: Column(
          children: const [
            // Search bar
            _SearchBar(),

            // Preview image
            Expanded(
              child: _ImageView(),
            ),

            // Image preview list
            _ImagePreviewList()
          ],
        ),
      ),
    );
  }

  void _uploadListener(BuildContext context, UploadState state) {
    if (state is LoadingState) {
      context.loaderOverlay.show();
    } else if (state is InvalidUrlState) {
      context.loaderOverlay.hide();
      Toast.showError('Imagen inválida');
    } else if (state is NoInternetConnectionState) {
      context.loaderOverlay.hide();
      Toast.showError('No tienes conexión a internet');
    } else if (state is FailedState) {
      context.loaderOverlay.hide();
      Toast.showError('Ha ocurrido un error inesperado');
    } else if (state is ImageLoadedState) {
      context.loaderOverlay.hide();
    }
  }
}
