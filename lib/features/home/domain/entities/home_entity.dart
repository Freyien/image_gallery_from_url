class HomeEntity {
  final int tabIndex;

  HomeEntity({
    this.tabIndex = 0,
  });

  HomeEntity copyWith({
    int? tabIndex,
  }) =>
      HomeEntity(
        tabIndex: tabIndex ?? this.tabIndex,
      );
}
