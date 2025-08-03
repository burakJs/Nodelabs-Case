import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';

final class PaginationBuilder<T> extends StatefulWidget {
  const PaginationBuilder({
    required this.itemBuilder,
    required this.onPageRequest,
    required this.dataList,
    required this.hasMore,
    super.key,
    this.onRefresh,
  }) : _separatorBuilder = null;

  const PaginationBuilder.separated({
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required this.onPageRequest,
    required this.dataList,
    required this.hasMore,
    super.key,
    this.onRefresh,
  }) : _separatorBuilder = separatorBuilder;

  final Widget Function(T data) itemBuilder;
  final IndexedWidgetBuilder? _separatorBuilder;
  final AsyncCallback onPageRequest;
  final AsyncCallback? onRefresh;
  final List<T> dataList;
  final bool hasMore;

  @override
  State<PaginationBuilder<T>> createState() => _PaginationBuilderState();
}

final class _PaginationBuilderState<T> extends State<PaginationBuilder<T>>
    with _PaginationBuilderMixin<T> {
  @override
  Widget build(BuildContext context) {
    if (widget._separatorBuilder != null) {
      return RefreshIndicator(
        onRefresh: () {
          if (widget.onRefresh == null) return Future.value();
          return widget.onRefresh!();
        },
        child: ListView.separated(
          padding: const AppPadding.verticalLow(),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _hasMore ? _items.length + 1 : _items.length,
          separatorBuilder: widget._separatorBuilder!,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == _items.length) {
              return const Padding(
                padding: AppPadding.verticalHigh(),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (index == _items.length) return const SizedBox.shrink();
            return widget.itemBuilder(_items[index]);
          },
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () {
        if (widget.onRefresh == null) return Future.value();
        return widget.onRefresh!();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _hasMore ? _items.length + 1 : _items.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == _items.length && _isLoading) {
            return Padding(
              padding: AppPadding.verticalHigh(),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          if (index == _items.length) return const SizedBox.shrink();
          return widget.itemBuilder(_items[index]);
        },
      ),
    );
  }
}

mixin _PaginationBuilderMixin<T> on State<PaginationBuilder<T>> {
  late final ScrollController _scrollController;
  bool _isLoading = false;

  bool get _hasMore => widget.hasMore;
  List<T> get _items => widget.dataList;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() async {
        if (_scrollController.position.pixels >
            _scrollController.position.maxScrollExtent) {
          await _onPageRequest();
        }
      });
  }

  Future<void> _onPageRequest() async {
    if (_isLoading) return;
    if (!_hasMore) return;
    _isLoading = true;
    setState(() {});
    await widget.onPageRequest();
    _isLoading = false;
    setState(() {});
  }
}
