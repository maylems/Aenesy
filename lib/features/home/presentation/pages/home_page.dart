import 'package:flutter/material.dart';

import '../../../../core/widgets/svg_icon.dart';
import '../../../auth/domain/entities/app_user.dart';
import '../models/tracking_item.dart';
import '../widgets/home_bottom_bar.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/hero_search_card.dart';
import '../widgets/nike_swoosh_icon.dart';
import '../widgets/tracking_item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final AppUser user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  late final List<TrackingItem> _trackingHistory = [
    TrackingItem(
      title: 'iPhone 14 Pro (Blue)',
      code: 'EV938507560CN',
      icon: const SvgIcon('assets/icons/apple.svg', color: Colors.black, size: 22),
      statusLabel: 'On the way',
      statusColor: const Color(0xFF88FAB3),
    ),
    TrackingItem(
      title: 'Nike Air Jordan Shoe',
      code: 'UQ252246764SG',
      icon: const NikeSwooshIcon(size: 20),
      statusLabel: 'Near you',
      statusSubLabel: '5.5 km away',
      statusColor: const Color(0xFF647EF3),
      statusTextColor: Colors.white,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const HomeBottomBar(),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            HomeTopBar(
              name: widget.user.name,
              address: '455-1182, Kaomachi Chida\nYamaga-shi, Japan',
            ),
            const SizedBox(height: 28),
            const Text.rich(
              TextSpan(
                text: 'Track Your Package\nSeamlessly ',
                children: [TextSpan(text: '📦')],
              ),
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            HeroSearchCard(
              name: widget.user.name,
              controller: _searchController,
              onSearch: () {},
            ),
            const SizedBox(height: 28),
            const Text(
              'Tracking History',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            for (final item in _trackingHistory) ...[
              TrackingItemTile(item: item),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
