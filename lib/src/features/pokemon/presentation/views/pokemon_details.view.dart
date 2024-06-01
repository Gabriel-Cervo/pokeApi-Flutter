import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi/src/core/utils/constants/colors_constants.dart';
import 'package:pokeapi/src/core/utils/constants/images_constants.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/viewmodel/pokemon_details_view_model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/widgets/pokemon_info.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/api_error.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/base_screen.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/cached_image.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/loading_indicator.widget.dart';

class PokemonDetailsView extends StatefulWidget {
  final Pokemon initialPokemon;
  final int totalPokemonInApi;

  const PokemonDetailsView(
      {super.key,
      required this.initialPokemon,
      required this.totalPokemonInApi});

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView>
    with SingleTickerProviderStateMixin {
  final _viewModel = PokemonDetailsViewModel();
  final double _headerHeight = 300.0;
  final _animationDuration = const Duration(milliseconds: 400);
  final _waitTimeToNextAnimation = const Duration(milliseconds: 300);

  double _dragOffset = 0.0;
  bool _isFetchingPrevPokemon = false;
  bool _isFetchingNextPokemon = false;

  Pokemon get activePokemon =>
      _viewModel.pokemonDetails ?? widget.initialPokemon;

  @override
  void initState() {
    super.initState();
    _viewModel.pokemonDetails = widget.initialPokemon;
    _viewModel.fetchPokemonSpecie(widget.initialPokemon.id);
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
        if (_isFetchingNextPokemon || _isFetchingPrevPokemon) {
          return _renderData();
        }

        return const Center(child: LoadingIndicator());
      case RequestState.error:
        return const BaseScreen(
          child: APIErrorWidget(
            title: "Ops... Ocorreu um erro ao carregar os dados desse pokémon!",
            subtitle: "Por favor, verifique sua conexão e tente novamente.",
          ),
        );
      case RequestState.success:
        return _renderData();
    }
  }

  Widget _renderData() {
    if (_viewModel.pokemonSpecie == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_renderHeader(), Expanded(child: _renderContent())],
    );
  }

  Widget _renderContent() {
    return Transform(
        transform: Matrix4.translationValues(0, -16, 0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: ColorsConstants.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PokemonInfoWidget(
              pokemon: activePokemon,
              specie: _viewModel.pokemonSpecie!,
            ),
          ),
        ));
  }

  Widget _renderHeader() {
    return Container(
        height: _headerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorsConstants.stringToColorMap[
                        _viewModel.pokemonSpecie!.color.name] ==
                    Colors.white
                ? Colors.grey
                : ColorsConstants
                    .stringToColorMap[_viewModel.pokemonSpecie!.color.name],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Stack(children: [
          Positioned(
            left: -56,
            bottom: -48,
            height: _headerHeight - 50,
            width: _headerHeight - 50,
            child: const Opacity(
                opacity: 0.2,
                child: Image(image: ImagesConstants.pokeballForBackground)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _renderBackButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _renderLeftButtonIfNeeded(),
                    _renderPokemonImage(),
                    _renderRightButtonIfNeeded()
                  ],
                ),
              )
            ],
          ),
        ]));
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

  Widget _renderLeftButtonIfNeeded() {
    if (isFirstPokemon()) {
      return const SizedBox(
        width: 36,
      );
    }

    return GestureDetector(
      onTap: _loadPrevPokemon,
      child: Icon(
        Icons.arrow_circle_left,
        size: 36,
        color: ColorsConstants.white,
      ),
    );
  }

  Widget _renderRightButtonIfNeeded() {
    if (isLastPokemon()) {
      return const SizedBox(
        width: 36,
      );
    }

    return GestureDetector(
      onTap: _loadNextPokemon,
      child: Icon(
        Icons.arrow_circle_right,
        size: 36,
        color: ColorsConstants.white,
      ),
    );
  }

  Widget _renderPokemonImage() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => _moveImageToOffset(details.delta),
      onHorizontalDragEnd: (_) => _didEndDrag(),
      child: Container(
        alignment: Alignment.center,
        child: Transform(
          transform: Matrix4.translationValues(_dragOffset, 16, 0),
          child: Hero(
            tag: activePokemon.sprites.frontDefault,
            child: CachedImageWidget(
              imageUrl: activePokemon.sprites.frontDefault,
              size: 200,
            ),
          ).animate().moveX(
              begin: MediaQuery.of(context).size.width,
              end: 0,
              duration: _animationDuration),
        ),
      )
          .animate(
              target: _isFetchingNextPokemon || _isFetchingPrevPokemon ? 1 : 0)
          .moveX(
              begin: _dragOffset,
              end: _isFetchingNextPokemon
                  ? -MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width,
              duration: _animationDuration),
    );
  }

  void _moveImageToOffset(Offset delta) {
    // can happen to be called after user swipe to prev screen
    if (mounted) {
      setState(() => _dragOffset += delta.dx / 2);
    }
  }

  void _didEndDrag() {
    final threshold = MediaQuery.of(context).size.width * 0.1;

    if (_dragOffset > threshold) {
      _loadPrevPokemon();
      return;
    }

    if (_dragOffset < -threshold) {
      _loadNextPokemon();
      return;
    }

    setState(() => _dragOffset = 0);
  }

  void _loadNextPokemon() async {
    if (isLastPokemon()) {
      setState(() => _dragOffset = 0);
      return;
    }

    setState(() => _isFetchingNextPokemon = true);
    await Future.delayed(_waitTimeToNextAnimation);
    await _viewModel.fetchNextPokemon();
    _resetFetchAndDragState();
  }

  void _loadPrevPokemon() async {
    if (isFirstPokemon()) {
      setState(() => _dragOffset = 0);
      return;
    }

    setState(() => _isFetchingPrevPokemon = true);
    await Future.delayed(_waitTimeToNextAnimation);
    await _viewModel.fetchPrevPokemon();
    _resetFetchAndDragState();
  }

  bool isFirstPokemon() {
    return activePokemon.order == 1;
  }

  bool isLastPokemon() {
    return activePokemon.order == (widget.totalPokemonInApi - 1);
  }

  void _resetFetchAndDragState() {
    setState(() {
      _isFetchingNextPokemon = false;
      _isFetchingPrevPokemon = false;
      _dragOffset = 0;
    });
  }
}
