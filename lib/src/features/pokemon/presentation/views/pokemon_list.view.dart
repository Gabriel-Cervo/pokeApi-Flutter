import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/features/pokemon/presentation/viewmodel/pokemon_list_view_model.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final PokemonListViewModel _viewModel = PokemonListViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildPokemonsData(),
        ),
      ),
    );
  }

  Observer _buildPokemonsData() {
    return Observer(
      builder: (_) {
        switch (_viewModel.fetchState) {
          case RequestState.loading:
          case RequestState.initial:
            return const CircularProgressIndicator();
          case RequestState.error:
            return const Text('error');
          case RequestState.success:
            return const Text('Carregou');
        }
      },
    );
  }
}
