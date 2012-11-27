function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function adjust_section(section) {
  var selection = $(section + " select option:selected").text();
  var entry_section = $(section + " .entry_section");
  var new_field = $(section + " input");

  if (endsWith(selection, "...")) {
    entry_section.slideDown();
  }
  else {
    entry_section.slideUp();
    new_field.val("");
  }
}

function display_other_if_present(section) {
  if ("" == $(section + " input").val()) {
    $(section + " .entry_section").css("display", "none");
  }
  else {
    $(section + " select option:last").attr('selected', 'selected');
  }
}

$(document).ready(function() {
  display_other_if_present("#modality");

  $("select#practitioner_modality_id").change(function() {
     adjust_section("#modality");
  });
});
