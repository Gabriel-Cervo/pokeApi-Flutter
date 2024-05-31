// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsViewModel on PokemonDetailsViewModelBase, Store {
  late final _$pokemonColorAtom =
      Atom(name: 'PokemonDetailsViewModelBase.pokemonColor', context: context);

  @override
  PokemonColor? get pokemonColor {
    _$pokemonColorAtom.reportRead();
    return super.pokemonColor;
  }

  @override
  set pokemonColor(PokemonColor? value) {
    _$pokemonColorAtom.reportWrite(value, super.pokemonColor, () {
      super.pokemonColor = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PokemonDetailsViewModelBase.error', context: context);

  @override
  Failure? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Failure? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchStateAtom =
      Atom(name: 'PokemonDetailsViewModelBase.fetchState', context: context);

  @override
  RequestState get fetchState {
    _$fetchStateAtom.reportRead();
    return super.fetchState;
  }

  @override
  set fetchState(RequestState value) {
    _$fetchStateAtom.reportWrite(value, super.fetchState, () {
      super.fetchState = value;
    });
  }

  late final _$fetchPokemonColorAsyncAction = AsyncAction(
      'PokemonDetailsViewModelBase.fetchPokemonColor',
      context: context);

  @override
  Future<void> fetchPokemonColor(int id) {
    return _$fetchPokemonColorAsyncAction
        .run(() => super.fetchPokemonColor(id));
  }

  @override
  String toString() {
    return '''
pokemonColor: ${pokemonColor},
error: ${error},
fetchState: ${fetchState}
    ''';
  }
}
