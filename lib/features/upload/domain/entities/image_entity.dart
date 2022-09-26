class ImageEntity {
  final String uuid;
  final String path;

  ImageEntity({
    required this.uuid,
    required this.path,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      uuid: json['uuid'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'path': path,
    };
  }
}
