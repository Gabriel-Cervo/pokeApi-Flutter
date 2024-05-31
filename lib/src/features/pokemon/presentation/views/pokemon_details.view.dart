import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi/src/core/utils/constants/colors_constants.dart';
import 'package:pokeapi/src/core/utils/constants/images_constants.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/viewmodel/pokemon_details_view_model.dart';
import 'package:pokeapi/src/shared/presentation/widget/api_error.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/cached_image.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/loading_indicator.widget.dart';

class PokemonDetailsView extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsView({super.key, required this.pokemon});

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  final _viewModel = PokemonDetailsViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchPokemonColor(widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      body: Observer(
        builder: (_) => _renderWidgetByState(),
      ),
    );
  }

  Widget _renderWidgetByState() {
    switch (_viewModel.fetchState) {
      case RequestState.loading:
      case RequestState.initial:
        return const Center(child: LoadingIndicator());
      case RequestState.error:
        return const APIErrorWidget(
          title: "Ops... Ocorreu um erro ao carregar os pokémons!",
          subtitle: "Por favor, verifique sua conexão e tente novamente.",
        );
      case RequestState.success:
        return _renderData();
    }
  }

  Widget _renderData() {
    if (_viewModel.pokemonColor == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorsConstants.stringToColorMap[
                            _viewModel.pokemonColor!.color.name] ==
                        Colors.white
                    ? Colors.grey
                    : ColorsConstants
                        .stringToColorMap[_viewModel.pokemonColor!.color.name],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Stack(children: [
              const Positioned(
                left: -56,
                bottom: -48,
                height: 250,
                width: 250,
                child: Opacity(
                    opacity: 0.2,
                    child: Image(image: ImagesConstants.pokeballForBackground)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _renderBackButton(),
                  Container(
                    alignment: Alignment.center,
                    child: Transform(
                      transform: Matrix4.translationValues(0, 16, 0),
                      child: Hero(
                        tag: widget.pokemon.sprites.frontDefault,
                        child: CachedImageWidget(
                          imageUrl: widget.pokemon.sprites.frontDefault,
                          size: 200,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ])),
        Transform(
            transform: Matrix4.translationValues(0, -16, 0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: ColorsConstants.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
            ))
      ],
    );
  }

  Widget _renderBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0, left: 8),
        child: Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.chevron_left,
              size: 36,
              color: ColorsConstants.white,
            )),
      ),
    );
  }
}
