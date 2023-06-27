String safeValueFromListAsString(List? list, int index) {
  if (list == null) {
    return "";
  } else if (index < 0 || index >= list.length) {
    return "";
  } else {
    return list[index].toString();
  }
}

double? valueFromListAsDouble(List? list, int index) {
  if (list == null) {
    return null;
  } else if (index < 0 || index >= list.length) {
    return null;
  } else {
    return list[index].toDouble();
  }
}
