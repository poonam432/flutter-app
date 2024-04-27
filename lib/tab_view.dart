import 'package:flutter/material.dart';


class PlainTabView extends StatefulWidget {
  const PlainTabView({
    super.key,
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget? stub;
  final ValueChanged<int>? onPositionChange;
  final ValueChanged<double>? onScroll;
  final int? initPosition;

  @override
  CustomTabsState createState() => CustomTabsState();
}

class CustomTabsState extends State<PlainTabView>
    with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    _currentCount = widget.itemCount;
    super.initState();
  }


  @override
  void dispose() {
    // controller.animation!.removeListener(onScroll);
    // controller.removeListener(onPositionChange);
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TabBar(
              isScrollable: true,
              controller: controller,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Theme.of(context).hintColor,
              indicator: BoxDecoration(

                border: Border(
                  bottom: BorderSide(
                    color:Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
              tabs: List.generate(
                widget.itemCount,
                    (index) => widget.tabBuilder(context, index),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: List.generate(
                widget.itemCount,
                    (index) => widget.pageBuilder(context, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

}