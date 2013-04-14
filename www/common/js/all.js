(function() {
  var Log, Main, UA, Util, init, mainInit,
    __slice = [].slice;

  Log = (function() {
    function Log() {}

    Log.enable = true;

    Log.log = function() {
      var args;

      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!this.enable) {
        return;
      }
      if (typeof console.log === 'function') {
        return console.log.apply(console, args);
      }
    };

    Log.info = function() {
      var args;

      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!this.enable) {
        return;
      }
      if (typeof console.info === 'function') {
        return console.info.apply(console, args);
      }
    };

    Log.debug = function() {
      var args;

      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!this.enable) {
        return;
      }
      if (typeof console.debug === 'function') {
        return console.debug.apply(console, args);
      }
    };

    Log.error = function() {
      var args;

      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!this.enable) {
        return;
      }
      if (typeof console.error === 'function') {
        return console.error.apply(console, args);
      }
    };

    Log.dir = function() {
      var args;

      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!this.enable) {
        return;
      }
      if (typeof console.dir === 'function') {
        return console.dir.apply(console, args);
      }
    };

    return Log;

  })();

  if (typeof window.console === "undefined") {
    window.console = {
      log: function() {},
      info: function() {},
      debug: function() {},
      error: function() {},
      dir: function() {}
    };
    Log.log = function() {};
    Log.info = function() {};
    Log.debug = function() {};
    Log.error = function() {};
    Log.dir = function() {};
  }

  this.Log = Log;

  UA = (function() {
    function UA() {}

    UA.ua = window.navigator.userAgent.toLowerCase();

    UA.win = false;

    UA.mac = false;

    UA.MSIE = false;

    UA.ie6 = false;

    UA.ie7 = false;

    UA.ie8 = false;

    UA.ie9 = false;

    UA.ie10 = false;

    UA.iPad = false;

    UA.iPhone = false;

    UA.android = false;

    UA.chrome = false;

    UA.webkit = false;

    UA.safari = false;

    UA.firefox = false;

    UA.smartphone = false;

    UA.touchDevice = false;

    UA.init = function() {
      this.win = this.ua.indexOf('windows') > -1;
      this.mac = this.ua.indexOf('mac') > -1;
      this.MSIE = this.ua.indexOf('msie');
      this.ie6 = this.MSIE && this.ua.indexOf('msie 6') > -1;
      this.ie7 = this.MSIE && this.ua.indexOf('msie 7') > -1;
      this.ie8 = this.MSIE && this.ua.indexOf('msie 8') > -1;
      this.ie9 = this.MSIE && this.ua.indexOf('msie 9') > -1;
      this.ie10 = this.MSIE && this.ua.indexOf('msie 10') > -1;
      this.iPhone = this.ua.indexOf('iphone') > -1 || this.ua.indexOf('iphone') > -1;
      this.iPad = this.ua.indexOf('ipad') > -1;
      this.android = this.ua.indexOf('android') > -1;
      this.chrome = this.ua.indexOf('chrome') > -1;
      this.webkit = this.ua.indexOf('webkit') > -1;
      this.firefox = this.ua.indexOf('firefox') > -1;
      this.safari = this.ua.indexOf('safari') > -1 && !this.chrome && !this.android && !this.iPhone && !this.iPad;
      this.smartphone = this.iPhone || this.android;
      return this.touchDevice = this.iPhone || this.iPad || this.android;
    };

    UA.initHtml = function() {
      var className, html;

      className = [];
      if (this.mac) {
        className.push("mac");
      } else {
        if (this.win) {
          className.push("win");
        }
      }
      if (this.android) {
        className.push("android");
      } else {
        if (this.iPhone || this.iPad) {
          className.push("ios");
        }
      }
      if (this.firefox) {
        className.push("firefox");
      } else {
        if (this.webkit) {
          className.push("webkit");
        }
      }
      className.push((this.smartphone ? "sp" : "pc"));
      html = document.getElementsByTagName("html")[0];
      return html.className += ' ' + className.join(" ");
    };

    return UA;

  })();

  Util = (function() {
    function Util() {}

    Util.getScrollPosition = function() {
      return {
        x: document.documentElement.scrollLeft || document.body.scrollLeft,
        y: document.documentElement.scrollTop || document.body.scrollTop
      };
    };

    Util.getDocumentSize = function() {
      return {
        width: document.documentElement.scrollWidth || document.body.scrollWidth,
        height: document.documentElement.scrollHeight || document.body.scrollHeight
      };
    };

    Util.getScreenSize = function() {
      return {
        x: document.body.clientWidth || document.documentElement.clientWidth,
        y: document.body.clientHeight || document.documentElement.clientHeight
      };
    };

    return Util;

  })();

  Main = (function() {
    function Main() {}

    Main.init = function() {
      return console.log('main init');
    };

    return Main;

  })();

  init = function() {
    UA.init();
    return UA.initHtml();
  };

  mainInit = function() {
    return Main.init();
  };

  $(mainInit);

}).call(this);
