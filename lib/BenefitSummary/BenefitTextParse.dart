

String tag1 = "<b>";
String tag2 = "<p>";
String tag3 = "<link>";
String tag4 = "<u>";
String tag5 = "<link><u><b>";
String tag6 = "<button>";
String tag7 = "<p style='padding-left: 10px;'>";


String tag1End = '{</b>}';
String tag2End = "{</p>}";
String tag3End = "{</link>}";
String tag4End = "{</u>}";
String tag5End = "{</b></u></link>}";
String tag6End = "{</button>}";

String settlement = "<bul>";

String removeBrackes(String value) {
  return value.replaceAll("{", "").replaceAll("}", "");
}

String removeEndBrackets(String value) {
  return value
      .replaceAll(removeBrackes(tag1End), "")
      .replaceAll(removeBrackes(tag2End), "")
      .replaceAll(removeBrackes(tag3End), "")
      .replaceAll(removeBrackes(tag4End), "")
      .replaceAll(removeBrackes(tag5End), "")
      .replaceAll(removeBrackes(tag6End), "")
      .replaceAll(removeBrackes(tag7), "")
      .replaceAll(settlement, "");
}

String removeAllBrackets(String value) {
  return value
      .replaceAll(removeBrackes(tag1End), "")
      .replaceAll(removeBrackes(tag2End), "")
      .replaceAll(removeBrackes(tag3End), "")
      .replaceAll(removeBrackes(tag4End), "")
      .replaceAll(removeBrackes(tag5End), "")
      .replaceAll(removeBrackes(tag6End), "")
      .replaceAll(removeBrackes(tag1), "")
      .replaceAll(removeBrackes(tag2), "")
      .replaceAll(removeBrackes(tag3), "")
      .replaceAll(removeBrackes(tag4), "")
      .replaceAll(removeBrackes(tag5), "")
      .replaceAll(removeBrackes(tag6), "")
      .replaceAll(removeBrackes(tag7), "")
      .replaceAll(settlement, "");
}

List<String> benefitText({required String text}) {



  var link =
      text.replaceAll(tag1, "").replaceAll(tag2, "").replaceAll(tag3, "").replaceAll(tag4, "").replaceAll(tag5, "").replaceAll(tag6, "");


  var link2 = link
      .replaceAll(removeBrackes(tag5End), "${settlement}|")
      .replaceAll(removeBrackes(tag1End), "${removeBrackes(tag1End)}|")
      .replaceAll(removeBrackes(tag6End), "${removeBrackes(tag6End)}|")
      .replaceAll(removeBrackes(tag2End), "${removeBrackes(tag2End)}|")
      .replaceAll(removeBrackes(tag3End), "${removeBrackes(tag3End)}|")
      .replaceAll(removeBrackes(tag4End), "${removeBrackes(tag4End)}|");

  var link3 = link2.replaceAll(">|<", "><");


  var finalSplitted = link3.split("|");
  return finalSplitted;
}
