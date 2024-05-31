import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/utils/constants/images_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showDivider;

  const AppBarWidget({super.key, this.title, this.showDivider = true});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: title == null
          ? null
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: ImagesConstants.pokeballBlack,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
      bottom: showDivider
          ? PreferredSize(
              preferredSize: const Size.fromHeight(11.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  color: Theme.of(context).dividerColor,
                  height: 1.0,
                ),
              ))
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(title == null && !showDivider ? 0 : 70);
}
