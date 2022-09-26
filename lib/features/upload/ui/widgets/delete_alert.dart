part of 'package:image_gallery_from_url/features/upload/ui/upload_page.dart';

class _DeleteAlert extends StatelessWidget {
  const _DeleteAlert({
    Key? key,
    required this.image,
    required this.context,
  }) : super(key: key);

  final ImageEntity image;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '¿Seguro que deseas eliminar esta imagen?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Image.file(
            File(image.path),
            height: 200,
            fit: BoxFit.contain,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCELAR'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            final bloc = context.read<UploadBloc>();
            bloc.add(DeleteImageEvent(image));
          },
          child: const Text('ELIMINAR'),
        ),
      ],
    );
  }
}
