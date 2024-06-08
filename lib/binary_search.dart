class BinarySearch {
  int easySearch(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;
    while (low <= high) {
      int mid = (low + ((high - low) / 2)).toInt();
      if (list[mid] == target) {
        return mid;
      } else if (list[mid] > target) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return -1;
  }

  int firstSearch(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;
    while (low <= high) {
      int mid = (low + ((high - low) / 2)).toInt();
      if (list[mid] > target) {
        high = mid - 1;
      } else if (list[mid] < target) {
        low = mid + 1;
      } else if (mid - 1 >= 0 && list[mid] == list[mid - 1]) {
        high = mid - 1;
      } else {
        return mid;
      }
    }

    return -1;
  }

  int lastSearch(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;
    while (low <= high) {
      int mid = (low + ((high - low) / 2)).toInt();
      if (list[mid] > target) {
        high = mid - 1;
      } else if (list[mid] < target) {
        low = mid + 1;
      } else if (mid + 1 < list.length && list[mid] == list[mid + 1]) {
        low = mid + 1;
      } else {
        return mid;
      }
    }
    return -1;
  }

  int firstGreater(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;
    while (low <= high) {
      int mid = (low + ((high - low) / 2)).toInt();
      if (list[mid] <= target) {
        low = mid + 1;
      } else if (mid - 1 >= 0 && list[mid - 1] > target) {
        high = mid - 1;
      } else {
        return mid;
      }
    }
    return -1;
  }

  int lastLess(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;
    while (low <= high) {
      int mid = (low + ((high - low) / 2)).toInt();
      if (list[mid] >= target) {
        high = mid - 1;
      } else if (mid + 1 < list.length && list[mid + 1] < target) {
        low = mid + 1;
      } else {
        return mid;
      }
    }
    return -1;
  }
}
