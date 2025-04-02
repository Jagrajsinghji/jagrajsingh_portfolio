import 'package:flutter/material.dart';

class DynamicSectionSelector extends StatefulWidget {
  final Map<String, GlobalKey> sections;
  final ScrollController scrollController;

  const DynamicSectionSelector(
      {super.key, required this.sections, required this.scrollController});

  @override
  State<DynamicSectionSelector> createState() => _DynamicSectionSelectorState();
}

class _DynamicSectionSelectorState extends State<DynamicSectionSelector> {
  String selectedSection = ""; // Current section in view

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    selectedSection = widget.sections.keys.first;
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    for (var entry in widget.sections.entries) {
      final key = entry.value;
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        if (position.dy < 200 && position.dy > -100) {
          // Adjust threshold
          setState(() {
            selectedSection = entry.key;
          });
          break;
        }
      }
    }
  }

  void _onDropdownTap() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(20, 50, 20, 0),
      // Adjust dropdown position
      items: widget.sections.keys.map((heading) {
        return PopupMenuItem<String>(
          value: heading,
          child: Text(heading,style: Theme.of(context).textTheme.bodyMedium,),
          onTap: () {
            _scrollToSection(heading);
          },
        );
      }).toList(),
    );
  }

  void _scrollToSection(String section) {
    final key = widget.sections[section];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        selectedSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onDropdownTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedSection,
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          SizedBox(width: 5),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
