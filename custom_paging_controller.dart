import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Custom Paging Controller for the infinite_scroll_pagination package.
///
/// @see [pub.dev](https://pub.dev/packages/infinite_scroll_pagination)
/// Tested package version: 5.1.0
///
/// - `T` is the type of the fetched data.
/// - `limit` is the limit of the page.
/// - `fetchPage` is the function to fetch the page.
/// - `getNextPageKey` is the function to get the next page key.
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

  /// Update an item in the list.
  void updateItem(T oldItem, T newItem) => mapItems((item) {
    if (item == oldItem) return newItem;
    return item;
  });

  /// Remove an item from the list.
  void removeItem(T item) => value = value.filterItems((i) => i != item);

  /// Add an item to the end of the list.
  void addItem(T item) => value = value.copyWith(
    keys: [...?value.keys, value.keys!.last + 1],
    pages: [
      ...?value.pages,
      [item],
    ],
  );

  /// Insert an item to the top of the list.
  void insertItemAtTop(T item) => value = value.copyWith(
    keys: [value.keys!.last + 1, ...?value.keys],
    pages: [
      [item],
      ...?value.pages,
    ],
  );
}
