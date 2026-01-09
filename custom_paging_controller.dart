import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Custom Paging Controller for the infinite scroll pagination
///
/// `T` is the type of the fetched data.
///
/// `limit` is the limit of the page.
///
/// `fetchPage` is the function to fetch the page.
///
/// `getNextPageKey` is the function to get the next page key.
class CustomPagingController<T extends Object>
    extends PagingController<int, T> {
  CustomPagingController({required super.fetchPage, this.limit = 20})
    : super(
        getNextPageKey: (PagingState<int, T> state) {
          final keys = state.keys;
          final pages = state.pages;
          if (keys == null) return 1;
          if (pages != null && pages.last.length < limit) return null;
          return keys.last + 1;
        },
      );

  /// Limit of the page
  final int limit;
}
