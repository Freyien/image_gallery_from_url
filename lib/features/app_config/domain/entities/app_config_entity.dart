class AppConfigEntity {
  final bool islogged;

  AppConfigEntity({
    this.islogged = false,
  });

  AppConfigEntity copyWith({
    bool? islogged,
  }) =>
      AppConfigEntity(
        islogged: islogged ?? this.islogged,
      );
}
