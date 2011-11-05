translationsShown = false;

$(document).ready(function() {
  $("table.translations .translation-options a").click(function(event) {
    event.preventDefault();
    $(this).parents(".phrase").find(".other-translations div[data-locale="+$(this).data("locale")+"]").slideToggle();
  });
  
  $("h3.switch .available-translations a").click(function(event) {
    event.preventDefault();
    translations = $("table.translations .other-translations div[data-locale=" + $(this).data("locale") + "]");
    if(translationsShown) {
      translations.slideUp();
      translationsShown = false;
    } else {
      translations.slideDown();
      translationsShown = true;
    }
  });
});
