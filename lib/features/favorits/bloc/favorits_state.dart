part of 'favorits_bloc.dart';

sealed class FavoritesState extends Equatable {
  final List<Note> favorits;
  const FavoritesState({required this.favorits});
  @override
  List<Object?> get props => [favorits];

  FavoritesState clone({List<Note>? favorits});
}

class FavoritesPageState extends FavoritesState {
  const FavoritesPageState({required super.favorits});

  @override
  FavoritesPageState clone({List<Note>? favorits}) {
    return FavoritesPageState(favorits: favorits ?? this.favorits);
  }
}
