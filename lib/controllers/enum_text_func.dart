String capitalizeAndAddSpaces(String input) {
  if (input.isEmpty) {
    return '';
  }

  StringBuffer output = StringBuffer(input[0].toUpperCase());

  for (int i = 1; i < input.length; i++) {
    if (input[i].toUpperCase() == input[i]) {
      output.write(' ');
    }
    output.write(input[i]);
  }

  return output.toString();
}
