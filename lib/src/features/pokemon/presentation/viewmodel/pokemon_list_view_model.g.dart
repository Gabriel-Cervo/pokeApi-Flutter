// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonListViewModel on PokemonListViewModelBase, Store {
  late final _$pokemonsAtom =
      Atom(name: 'PokemonListViewModelBase.pokemons', context: context);

  @override
  List<Pokemon>? get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon>? value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
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

  late final _$pageAtom =
      Atom(name: 'PokemonListViewModelBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$hasReachedEndAtom =
      Atom(name: 'PokemonListViewModelBase.hasReachedEnd', context: context);

  @override
  bool get hasReachedEnd {
    _$hasReachedEndAtom.reportRead();
    return super.hasReachedEnd;
  }

  @override
  set hasReachedEnd(bool value) {
    _$hasReachedEndAtom.reportWrite(value, super.hasReachedEnd, () {
      super.hasReachedEnd = value;
    });
  }

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('PokemonListViewModelBase.fetchPokemons', context: context);

  @override
  Future<void> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  late final _$PokemonListViewModelBaseActionController =
      ActionController(name: 'PokemonListViewModelBase', context: context);

  @override
  Future<void> fetchNextPage() {
    final _$actionInfo = _$PokemonListViewModelBaseActionController.startAction(
        name: 'PokemonListViewModelBase.fetchNextPage');
    try {
      return super.fetchNextPage();
    } finally {
      _$PokemonListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
error: ${error},
fetchState: ${fetchState},
page: ${page},
hasReachedEnd: ${hasReachedEnd}
    ''';
  }
}
