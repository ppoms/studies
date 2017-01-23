casper.test.begin('(6) Checkboxes selecionados em itálico', 24, function suite(test) {

  casper.start("file://" + FORM_FILE);

  /**
   * Início: nenhum checkbox selecionado, nada em itálico.
   */

  casper.then(function() {
    var italic = "italic";

    var fontStyles = this.evaluate(function() {
      var checkboxes = document.querySelectorAll("input[type=checkbox]");
      var obj = {};
      for (var i = 0; i < checkboxes.length; i++) {

        var label = checkboxes[i].parentElement;
        obj[label.innerText] = window.getComputedStyle(label)["font-style"];
      }
      return obj;
    });

    for (var key in fontStyles) {
      if (fontStyles.hasOwnProperty(key)) {
        test.assertEquals(fontStyles[key], "normal", "'" + key + "' não aparece em itálico");
      }
    }
  });

  casper.then(function() {
    this.evaluate(function() {
      document.querySelectorAll("input[name=interests][value='2']")[0].click();
      document.querySelectorAll("input[name=interests][value='9']")[0].click();
    });
  });

  casper.then(function() {
    var fontStyles = this.evaluate(function() {
      var checkboxes = document.querySelectorAll("input[type=checkbox]");
      var obj = {};
      for (var i = 0; i < checkboxes.length; i++) {
        var label = checkboxes[i].parentElement;
        obj[label.innerText] = window.getComputedStyle(label)["font-style"];
      }
      return obj;
    });

    for (var key in fontStyles) {
      if (fontStyles.hasOwnProperty(key)) {
        if (key === "Banco de dados" || key === "Redes de computadores") {
          test.assertEquals(fontStyles[key], "italic", "'" + key + "' aparece em itálico");
        }
        else {
          test.assertEquals(fontStyles[key], "normal", "'" + key + "' não aparece em itálico");
        }
      }
    }
  });

  casper.run(function() { test.done(); });

});