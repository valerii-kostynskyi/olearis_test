import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test/view/components/logo_widget.dart';
import 'package:olearis_test/view/home/cubit/home_screen_cubit.dart';
import 'package:olearis_test/view/home/widget/grid_view.dart';

class HomeView extends StatelessWidget {
  final GlobalKey _keyGridView = GlobalKey();
  final GlobalKey _keyLogoWidget = GlobalKey();

  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    ? _content(state.isScrollable, state.items)
                    : SizedBox(
                        height: constraints.maxHeight,
                        child: _content(state.isScrollable, state.items),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _content(
    bool isScrollAvalible,
    List<String> items,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _logo(isScrollAvalible),
        CustomGridView(key: _keyGridView, items: items),
      ],
    );
  }

  Widget _logo(
    bool isScrollAvalible,
  ) {
    final Widget logoWidget = Padding(
      key: _keyLogoWidget,
      padding: const EdgeInsets.all(30.0),
      child: const LogoWidget(isShowBorder: true),
    );

    return isScrollAvalible
        ? logoWidget
        : Expanded(child: Center(child: logoWidget));
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
