import 'package:flutter/widgets.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/config.dart';
import 'package:vader_popup/parts/content.dart';
import 'package:vader_popup/parts/header.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.header,
    this.content,
    this.config,
    this.buttons = const [],
    this.isScrollable = false,
    this.scrollController,
  });

  final PopupHeader? header;
  final PopupContent? content;
  final PopupConfig? config;
  final List<PopupButton> buttons;
  final bool isScrollable;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final scrollView = SingleChildScrollView(
      controller: scrollController,
      child: content,
    );
    final children = [
      Center(child: header ?? const SizedBox()),
      const SizedBox(height: 16),
      isScrollable ? Expanded(child: scrollView) : content ?? const Placeholder(),
      const SizedBox(height: 16),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        direction: buttons.length <= 2 ? Axis.horizontal : Axis.vertical,
        alignment: WrapAlignment.end,
        children: buttons,
      )
    ];

    return isScrollable ? Column(children: children) : Wrap(runSpacing: 16, children: children);
  }
}
