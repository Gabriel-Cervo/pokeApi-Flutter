import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi/src/core/utils/constants/images_constants.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/viewmodel/pokemon_list_view_model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/views/pokemon_details.view.dart';
import 'package:pokeapi/src/features/pokemon/presentation/widgets/pokemon_list_tile.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/api_error.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/base_screen.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/loading_indicator.widget.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final PokemonListViewModel _viewModel = PokemonListViewModel();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchPokemons();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          !_viewModel.hasReachedEnd) {
        _viewModel.fetchNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: 'Pokedex',
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ImagesConstants.dexBG,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildPokemonsData(),
          ),
        ));
  }

  Observer _buildPokemonsData() {
    return Observer(
      builder: (_) {
        if (_viewModel.page > 1) {
          return _renderPokemonsList();
        }

        return _renderWidgetByState();
      },
    );
  }

  Widget _renderWidgetByState() {
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
        if (_viewModel.page > 1) {
          return const SizedBox.shrink();
        }
        return _renderPokemonsList();
    }
  }

  Widget _renderPokemonsList() {
    if (_viewModel.pokemons == null) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 32),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  final pokemon = _viewModel.pokemons![index];
                  return PokemonListTile(
                    pokemon: pokemon,
                    onTap: () => _didTapPokemon(pokemon, context),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: _viewModel.pokemons!.length),
            _viewModel.page > 1
                ? _renderWidgetByState()
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  void _didTapPokemon(Pokemon pokemon, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PokemonDetailsView(pokemon: pokemon)));
  }
}
