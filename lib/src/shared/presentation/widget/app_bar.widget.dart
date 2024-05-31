import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/utils/constants/images_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
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
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(11.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              color: Theme.of(context).dividerColor,
              height: 1.0,
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
