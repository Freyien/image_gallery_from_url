part of 'package:image_gallery_from_url/features/upload/ui/upload_page.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: AppColors.scaffold,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search input
              const Expanded(
                child: _SearchInput(),
              ),

              const SizedBox(width: 8),

              // Upload button
              PrimaryButton(
                text: 'Cargar\nImagen',
                onPressed: () {
                  Keyboard.close(context);
                  if (!key.currentState!.validate()) {
                    return;
                  }

                  final bloc = context.read<UploadBloc>();
                  bloc.add(UploadImageEvent());
                },
                minimumWidth: 0,
                minimumHeight: 47,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchInput extends StatefulWidget {
  const _SearchInput({Key? key}) : super(key: key);

  @override
  State<_SearchInput> createState() => __SearchInputState();
}

class __SearchInputState extends State<_SearchInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadBloc, UploadState>(
      listener: (context, state) {
        if (state is UrlClearedState) {
          controller.text = '';
        }
      },
      child: InputText(
        controller: controller,
        hintText: 'URL de imagen',
        prefixIcon: const Icon(CupertinoIcons.link),
        textInputAction: TextInputAction.done,
        onChanged: (url) {
          final bloc = context.read<UploadBloc>();
          bloc.add(ChangeUrlEvent(url));
        },
        validator: (_) {
          final bloc = context.read<UploadBloc>();
          final url = bloc.state.uploadEntity.urlEntity;
          if (url.valid) return null;

          switch (url.error!) {
            case UrlValidationError.invalid:
              return 'Url inválida';
          }
        },
      ),
    );
  }
}
