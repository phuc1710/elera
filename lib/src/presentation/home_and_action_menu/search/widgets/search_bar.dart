import 'package:flutter/material.dart';

import '../../search/widgets/filter_bottom_sheet_content.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.atHome,
    this.onSubmitted,
    this.controller,
    this.onChanged,
    this.showOverlayResultPrediction = false,
    this.data = const <String?>[],
    required this.onFocus,
  }) : super(key: key);

  final bool atHome;
  final VoidCallback onFocus;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  final bool showOverlayResultPrediction;
  final List<String?> data;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  List<String?> alPredictions = [];

  final FocusNode focusNode = FocusNode();

  bool? isFocus;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      isFocus = focusNode.hasPrimaryFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        decoration: BoxDecoration(
          color: isFocus ?? true && !widget.atHome
              ? const Color(0xFFEFF3FF)
              : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15),
          border: isFocus ?? true && !widget.atHome
              ? Border.all(color: Theme.of(context).primaryColor)
              : null,
        ),
        child: SizedBox(
          height: 50,
          child: TextField(
            focusNode:
                widget.atHome ? FocusNode(canRequestFocus: false) : focusNode,
            controller: widget.controller,
            autofocus: !widget.atHome,
            autocorrect: false,
            onTap: () {
              widget.onFocus();
              focusNode.requestFocus();
            },
            onSubmitted: widget.onSubmitted,
            onChanged: (text) {
              widget.onChanged?.call(text);

              if (widget.showOverlayResultPrediction) {
                if (text.isEmpty) {
                  alPredictions.clear();
                  _overlayEntry?.remove();

                  return;
                }

                if (widget.data.isNotEmpty) {
                  alPredictions.clear();
                  final result = widget.data
                      .where((e) => e?.contains(text) == true)
                      .toList();

                  alPredictions.addAll(result);
                }

                _overlayEntry = null;
                _overlayEntry = _createOverlayEntry();

                if (_overlayEntry != null) {
                  Overlay.of(context)?.insert(_overlayEntry!);
                }
              }
            },
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: isFocus ?? true && !widget.atHome
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400],
              ),
              suffixIcon: widget.atHome
                  ? Icon(
                      Icons.filter_alt_outlined,
                      color: Theme.of(context).primaryColor,
                    )
                  : IconButton(
                      onPressed: () => showSearchFilterBottomSheet(context),
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      splashRadius: 10,
                    ),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: isFocus ?? true && !widget.atHome
                        ? Colors.black
                        : Colors.grey[400],
                  ),
            ),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }

  dynamic showSearchFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, void Function(void Function()) setState) {
            return const FilterBottomSheetContent();
          },
        );
      },
    );
  }

  OverlayEntry? _createOverlayEntry() {
    if (context.findRenderObject() != null) {
      final renderBox = context.findRenderObject() as RenderBox?;
      final size = renderBox?.size ?? Size.zero;
      final offset = renderBox?.localToGlobal(Offset.zero);

      return OverlayEntry(
        builder: (context) => Positioned(
          left: offset?.dx,
          top: size.height + (offset?.dy ?? 0),
          width: size.width,
          child: CompositedTransformFollower(
            showWhenUnlinked: false,
            link: _layerLink,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 1.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: alPredictions.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      widget.onSubmitted?.call(alPredictions[index]);
                      removeOverlay();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        alPredictions[index] ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    return null;
  }

  void removeOverlay() {
    alPredictions.clear();
    _overlayEntry = _createOverlayEntry();

    Overlay.of(context)!.insert(_overlayEntry!);
    _overlayEntry!.markNeedsBuild();
  }
}
