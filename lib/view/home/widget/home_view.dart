import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test/view/components/logo_widget.dart';
import 'package:olearis_test/view/home/cubit/home_screen_cubit.dart';

class HomeView extends StatelessWidget {
  final GlobalKey _keyGridView = GlobalKey();
  final GlobalKey _keyLogoWidget = GlobalKey();

  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Markup test'),
        actions: _buildAppBarActions(context),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) =>
              BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (ctx, state) {
              WidgetsBinding.instance.addPostFrameCallback((value) {
                final isScrollAvalible =
                    _isScrollAvailable(constraints.maxHeight);
                context
                    .read<HomeScreenCubit>()
                    .checkScrolablility(isScrollAvalible);
              });

              return SingleChildScrollView(
                physics: state.isScrollable
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: state.isScrollable
                    ? _content(theme, state.isScrollable, state.items)
                    : SizedBox(
                        height: constraints.maxHeight,
                        child: _content(theme, state.isScrollable, state.items),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _content(
    ThemeData theme,
    bool isScrollAvalible,
    List<String> items,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getLogo(theme, isScrollAvalible),
        _getGrid(theme, items),
      ],
    );
  }

  Widget _getLogo(
    ThemeData theme,
    bool isScrollAvalible,
  ) {
    final Widget logoWidget = Padding(
      key: _keyLogoWidget,
      padding: const EdgeInsets.all(30.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: theme.primaryColor,
          ),
        ),
        child: const LogoWidget(),
      ),
    );

    return isScrollAvalible
        ? logoWidget
        : Expanded(child: Center(child: logoWidget));
  }

  Widget _getGrid(ThemeData theme, List<String> items) {
    return GridView.count(
      key: _keyGridView,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 4,
      children: items
          .asMap()
          .entries
          .map((entry) => _item(theme, entry.key, entry.value))
          .toList(),
    );
  }

  Widget _item(ThemeData theme, int index, String item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: Center(
        child: Text(
          '$item $index',
          style: theme.textTheme.displayMedium,
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            context.read<HomeScreenCubit>().removeItem();
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            context.read<HomeScreenCubit>().addItem("Item");
          },
        ),
      ];

  bool _isScrollAvailable(
    double maxHeight,
  ) {
    final gridHight = _getHeight(_keyGridView);
    final logoHiehgt = _getHeight(_keyLogoWidget);
    return maxHeight - gridHight - logoHiehgt <= 0;
  }

  double _getHeight(GlobalKey key) {
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    return renderObject == null ? 0 : (renderObject as RenderBox).size.height;
  }
}
