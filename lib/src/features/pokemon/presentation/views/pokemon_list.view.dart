import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/features/pokemon/presentation/viewmodel/pokemon_list_view_model.dart';
import 'package:pokeapi/src/shared/presentation/widget/api_error.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/loading_indicator.widget.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildPokemonsData(),
          ),
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
            return const Center(child: LoadingIndicator());
          case RequestState.error:
            //TODO: - add button to retry req
            return const APIErrorWidget(
              title: "Ops... Ocorreu um erro ao carregar os pokémons!",
              subtitle: "Por favor, verifique sua conexão e tente novamente.",
            );
          case RequestState.success:
            return const Text('Carregou');
        }
      },
    );
  }
}
