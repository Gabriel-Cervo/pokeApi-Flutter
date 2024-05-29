// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonListViewModel on PokemonListViewModelBase, Store {
  late final _$pokemonListAtom =
      Atom(name: 'PokemonListViewModelBase.pokemonList', context: context);

  @override
  PokemonList? get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(PokemonList? value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PokemonListViewModelBase.error', context: context);

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
      Atom(name: 'PokemonListViewModelBase.fetchState', context: context);

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

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('PokemonListViewModelBase.fetchPokemons', context: context);

  @override
  Future<void> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
error: ${error},
fetchState: ${fetchState}
    ''';
  }
}
