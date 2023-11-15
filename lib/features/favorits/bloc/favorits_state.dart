part of 'favorits_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesPageState extends FavoritesState {
  final List<Note> favorits;
  const FavoritesPageState(this.favorits);

  @override
  List<Object?> get props => [favorits];
}
