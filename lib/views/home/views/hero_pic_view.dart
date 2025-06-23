import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';
import 'package:personal_portfolio/utils/extensions/theme_extensions.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_state_provider.dart';
import '../../../providers/indie_model_provider.dart';
import '../widgets/hero_pic_widgets/hero_pic_page.dart';
import '../widgets/hero_pic_widgets/hero_pic_app_bar.dart';

class HeroPicView extends StatefulWidget {
  const HeroPicView({super.key});

  @override
  State createState() => _HeroPicViewState();
}

class _HeroPicViewState extends State<HeroPicView>
    with TickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 400);

  late final int _randomPageIndex = Random().nextInt(3);

  late final _page0TopTitleController = _createController(1.0);
  late final _page0BottomTitleController = _createController(1.0);
  late final _page1TopTitleController = _createController();
  late final _page1BottomTitleController = _createController();
  late final _page2TopTitleController = _createController();
  late final _page2BottomTitleController = _createController();
  late final _controller = Indie3dModelController()
    ..addListener(() => setState(() {}));
  final List<AnimationController> _controllers = [];
  int _pageIndex = 0;
  bool _assetsPreloaded = false;

  @override
  void initState() {
    super.initState();
    // Precache assets after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadAssets();
    });
  }

  Future<void> _preloadAssets() async {
    if (!_assetsPreloaded) {
      print('Starting asset precache');
      try {
        // Precache all required assets with corrected paths
        await Future.wait([
          precacheImage(
            AssetImage('assets/images/kishore.png'),
            context,
          ),
          precacheImage(
            AssetImage('assets/images/noise.png'),
            context,
          ),
        ]);
        if (mounted) {
          print('Assets precached successfully');
          setState(() {
            _assetsPreloaded = true;
            _controller.init(context);
          });
        }
      } catch (e) {
        print('Error precaching assets: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load assets: $e'),
              duration: const Duration(seconds: 5),
            ),
          );
          setState(() {
            _assetsPreloaded = true; // Fallback to avoid infinite loading
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _controllers.forEach((c) => c.dispose());
    _controller.dispose();
    super.dispose();
  }

  AnimationController _createController([double value = 0]) {
    final controller = AnimationController(
      vsync: this,
      duration: _duration,
      value: value,
    )..addListener(() => setState(() {}));
    _controllers.add(controller);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    _controller.setView(MediaQuery.of(context).size);

    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth * 0.8,
      child: _assetsPreloaded
          ? Stack(
              children: [
                GestureDetector(
                  onTapUp: _handleTap,
                  child: _buildPages(),
                ),
                HeroPicAppBar(),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildPages() {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScroll,
      child: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: _handlePageChange,
        children: [
          _buildPageForIndex(0),
        ],
      ),
    );
  }

  Widget _buildPageForIndex(int index) {
    final isLightMode =
        Provider.of<AppStateProvider>(context, listen: false).isLightMode;

    switch (index) {
      case 0:
      default:
        return HeroPicPage(
          topTitle: 'KISHORE',
          bottomTitle: 'KUMAR',
          backgroundColor: context.theme().colorScheme.secondary,
          image: AssetImage(
            'assets/images/kishore.png',
          ),
          pageIndex: _randomPageIndex,
          controller: _controller,
          topTitleClipProgress: 1.0 - _page0TopTitleController.value,
          bottomTitleClipProgress: 1.0 - _page0BottomTitleController.value,
          bottomTitleScale: 1.0,
        );
      // case 1:
      //   return Indie3dPage(
      //     topTitle: 'BRET',
      //     bottomTitle: 'HAMPTON',
      //     backgroundColor: const Color(0xFFECA6C8),
      //     image: AssetImage(
      //       'assets/images/kishore.png',
      //     ),
      //     pageIndex: 1,
      //     controller: _controller,
      //     topTitleClipProgress: 1.0 - _page1TopTitleController.value,
      //     bottomTitleClipProgress: 1.0 - _page1BottomTitleController.value,
      //     backgroundShapeOpacity: 1.0,
      //     bottomTitleScale: 0.9,
      //   );
      // case 2:
      // default:
      //   return Indie3dPage(
      //     topTitle: 'CINDY',
      //     bottomTitle: 'GREY',
      //     backgroundColor: const Color(0xFFFFD500),
      //     image: AssetImage(
      //       'assets/images/kishore.png',
      //     ),
      //     pageIndex: 2,
      //     controller: _controller,
      //     topTitleClipProgress: 1.0 - _page2TopTitleController.value,
      //     bottomTitleClipProgress: 1.0 - _page2BottomTitleController.value,
      //   );
    }
  }

  bool _handleScroll(ScrollUpdateNotification scrollUpdate) {
    setState(() {
      final appSize = MediaQuery.of(context).size;
      double pageProgress = (1.0 -
                  ((scrollUpdate.metrics.pixels / appSize.width) - _pageIndex)
                      .abs()
                      .clamp(0.0, 1.0)) *
              2.0 -
          1.0;
      _controller.cameraOffset =
          (1 - pageProgress) * 8.0 * (scrollUpdate.scrollDelta?.sign ?? 1);

      double animValue = 0;
      switch (_pageIndex) {
        case 0:
          animValue = _page0TopTitleController.value;
          break;
        case 1:
          animValue = _page1TopTitleController.value;
          break;
        case 2:
          animValue = _page2TopTitleController.value;
          break;
      }

      if (animValue != 0) {
        switch (_pageIndex) {
          case 0:
            if (!_page0TopTitleController.isAnimating) {
              _page0TopTitleController.value = pageProgress;
              _page0BottomTitleController.value = pageProgress;
            }
            break;
          case 1:
            if (!_page1TopTitleController.isAnimating) {
              _page1TopTitleController.value = pageProgress;
              _page1BottomTitleController.value = pageProgress;
            }
            break;
          case 2:
            if (!_page2TopTitleController.isAnimating) {
              _page2TopTitleController.value = pageProgress;
              _page2BottomTitleController.value = pageProgress;
            }
            break;
        }
      }
      switch (_pageIndex) {
        case 0:
          if (pageProgress > 0.99) {
            _page0TopTitleController.animateTo(1.0);
            Future.delayed(const Duration(milliseconds: 200),
                () => _page0BottomTitleController.animateTo(1.0));
          }
          _page1TopTitleController.reset();
          _page1BottomTitleController.reset();
          _page2TopTitleController.reset();
          _page2BottomTitleController.reset();
          break;
        case 1:
          _page0TopTitleController.reset();
          _page0BottomTitleController.reset();
          if (pageProgress > 0.99) {
            _page1TopTitleController.animateTo(1.0);
            Future.delayed(const Duration(milliseconds: 200),
                () => _page1BottomTitleController.animateTo(1.0));
          }
          _page2TopTitleController.reset();
          _page2BottomTitleController.reset();
          break;
        case 2:
          _page0TopTitleController.reset();
          _page0BottomTitleController.reset();
          _page1TopTitleController.reset();
          _page1BottomTitleController.reset();
          if (pageProgress > 0.99) {
            _page2TopTitleController.animateTo(1.0);
            Future.delayed(const Duration(milliseconds: 200),
                () => _page2BottomTitleController.animateTo(1.0));
          }
          break;
      }
    });

    return false;
  }

  void _handleTap(TapUpDetails details) {
    _controller.triggerTap(context, details.localPosition, _pageIndex);
  }

  void _handlePageChange(int page) {
    setState(() {
      _pageIndex = page;
    });
  }
}
