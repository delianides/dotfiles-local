var CENTRE, CONTROL_ALT_SHIFT, CONTROL_CMD, CONTROL_SHIFT, ChainWindow, HIDDEN_DOCK_MARGIN, INCREMENT, LEFT, NE, NW, RIGHT, SE, SW;

Phoenix.set({
  daemon: true,
  openAtLogin: true
});

HIDDEN_DOCK_MARGIN = 3;
INCREMENT = 0.05;
CONTROL_CMD = ['ctrl', 'cmd'];
CONTROL_SHIFT = ['ctrl', 'shift'];
CONTROL_ALT_SHIFT = ['ctrl', 'alt', 'shift'];
LEFT = 'left';
RIGHT = 'right';
CENTRE = 'centre';
NW = 'nw';
NE = 'ne';
SE = 'se';
SW = 'sw';

ChainWindow = (function() {
  function ChainWindow(window1, margin) {
    this.window = window1;
    this.margin = margin != null ? margin : 10;
    this.frame = this.window.frame();
    this.parent = this.window.screen().flippedVisibleFrame();
  }

  ChainWindow.prototype.difference = function() {
    return {
      x: this.parent.x - this.frame.x,
      y: this.parent.y - this.frame.y,
      width: this.parent.width - this.frame.width,
      height: this.parent.height - this.frame.height
    };
  };

  ChainWindow.prototype.set = function() {
    this.window.setFrame(this.frame);
    this.frame = this.window.frame();
    return this;
  };

  ChainWindow.prototype.screen = function(screen) {
    this.parent = screen.flippedVisibleFrame();
    return this;
  };

  ChainWindow.prototype.to = function(direction) {
    var difference;
    difference = this.difference();
    switch (direction) {
      case NW:
      case SW:
        this.frame.x = this.parent.x + this.margin;
        break;
      case NE:
      case SE:
        this.frame.x = this.parent.x + difference.width - this.margin;
        break;
      case CENTRE:
        this.frame.x = this.parent.x + (difference.width / 2);
    }
    switch (direction) {
      case NW:
      case NE:
        this.frame.y = this.parent.y + this.margin;
        break;
      case SE:
      case SW:
        this.frame.y = this.parent.y + difference.height - this.margin;
        break;
      case CENTRE:
        this.frame.y = this.parent.y + (difference.height / 2);
    }
    return this;
  };

  ChainWindow.prototype.resize = function(factor) {
    var delta, difference;
    difference = this.difference();
    if (factor.width != null) {
      delta = Math.min(this.parent.width * factor.width, difference.x + difference.width - this.margin);
      this.frame.width += delta;
    }
    if (factor.height != null) {
      delta = Math.min(this.parent.height * factor.height, difference.height - this.frame.y + this.margin + HIDDEN_DOCK_MARGIN);
      this.frame.height += delta;
    }
    return this;
  };

  ChainWindow.prototype.maximise = function() {
    this.frame.width = this.parent.width - (2 * this.margin);
    this.frame.height = this.parent.height - (2 * this.margin);
    return this;
  };

  ChainWindow.prototype.halve = function() {
    this.frame.width /= 2;
    return this;
  };

  ChainWindow.prototype.fit = function() {
    var difference;
    difference = this.difference();
    if (difference.width < 0 || difference.height < 0) {
      this.maximise();
    }
    return this;
  };

  ChainWindow.prototype.fill = function(direction) {
    this.maximise();
    if (direction === LEFT || direction === RIGHT) {
      this.halve();
    }
    switch (direction) {
      case LEFT:
        this.to(NW);
        break;
      case RIGHT:
        this.to(NE);
        break;
      default:
        this.to(NW);
    }
    return this;
  };

  return ChainWindow;

})();

Window.prototype.chain = function() {
  return new ChainWindow(this);
};

Window.prototype.to = function(direction, screen) {
  var window;
  window = this.chain();
  if (screen != null) {
    window.screen(screen).fit();
  }
  return window.to(direction).set();
};

Window.prototype.fill = function(direction, screen) {
  var window;
  window = this.chain();
  if (screen != null) {
    window.screen(screen);
  }
  window.fill(direction).set();
  if (direction === RIGHT) {
    return window.to(NE).set();
  }
};

Window.prototype.resize = function(factor) {
  return this.chain().resize(factor).set();
};

Key.on('a', CONTROL_CMD, function() {
  var window;
  window = Window.focused();
  return window != null ? window.fill(null, window.screen().next()) : void 0;
});

Key.on('l', CONTROL_CMD, function() {
  var window;
  window = Window.focused();
  return window != null ? window.fill(LEFT, window.screen().next()) : void 0;
});

Key.on('r', CONTROL_CMD, function() {
  var window;
  window = Window.focused();
  return window != null ? window.fill(RIGHT, window.screen().next()) : void 0;
});

