import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_cookbook/ui/postview/post_screen.dart';
import '../../widgets/layout_widgets_screen.dart';
import '../../widgets/button_input_widgets_screen.dart';
import '../../widgets/info_widgets_screen.dart';
import '../../widgets/material_widgets_screen.dart';
import '../../widgets/async_widgets_screen.dart';

class HomeNotifier extends AutoDisposeNotifier<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> build() {
    return [
      {
        'title': 'Basics & Layout Widgets',
        'icon': Icons.layers,
        'screen': const LayoutWidgetsScreen(),
        'desc': 'Rows, Columns, Stacks, Padding, Container, and Alignment.'
      },
      {
        'title': 'Buttons & Inputs',
        'icon': Icons.smart_button,
        'screen': const ButtonInputWidgetsScreen(),
        'desc': 'Elevated, Text, Icon, Toggle buttons, and TextFields.'
      },
      {
        'title': 'Information Display',
        'icon': Icons.branding_watermark,
        'screen': const InfoDisplayWidgetsScreen(),
        'desc': 'Cards, Badges, Chips, Progress Indicators, and Lists.'
      },
      {
        'title': 'Material Components',
        'icon': Icons.widgets,
        'screen': const MaterialComponentsScreen(),
        'desc': 'Banners, Dialogs, Tooltips, Navigation, and Sheets.'
      },
      {
        'title': 'Async & Network Widgets',
        'icon': Icons.cloud_sync,
        'screen': const AsyncWidgetsScreen(),
        'desc': 'FutureBuilders, StreamBuilders, and async delay operations.'
      },
      {
        'title': 'API Call',
        'icon': Icons.network_cell,
        'screen': const PostScreen(),
        'desc': 'Make an API call that flows from network client to UI!'
      }
    ];
  }
}

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, List<Map<String, dynamic>>>(() {
  return HomeNotifier();
});
