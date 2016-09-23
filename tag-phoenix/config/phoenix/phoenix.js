#!/usr/bin/env coffee -p

# Preferences
Phoenix.set
  daemon: true
  openAtLogin: true

# Globals
HIDDEN_DOCK_MARGIN = 3
INCREMENT = 0.05
CONTROL_CMD = [ 'ctrl', 'cmd' ]
CONTROL_SHIFT = [ 'ctrl', 'shift' ]
CONTROL_ALT_SHIFT = [ 'ctrl', 'alt', 'shift' ]

# Relative Directions
LEFT = 'left'
RIGHT = 'right'
CENTRE = 'centre'

# Cardinal Directions
NW = 'nw'
NE = 'ne'
SE = 'se'
SW = 'sw'

class ChainWindow
  constructor: (@window, @margin = 10) ->
    @frame = @window.frame()
    @parent = @window.screen().flippedVisibleFrame()

  # Difference frame
  difference: ->
    x: @parent.x - @frame.x
    y: @parent.y - @frame.y
    width: @parent.width - @frame.width
    height: @parent.height - @frame.height

  # Set frame
  set: ->
    @window.setFrame @frame
    @frame = @window.frame()
    this

  # Move to screen
  screen: (screen) ->
    @parent = screen.flippedVisibleFrame()
    this

  # Move to cardinal directions NW, NE, SE, SW or relative direction CENTRE
  to: (direction) ->

    difference = @difference()

    # X-coordinate
    switch direction
      when NW, SW
        @frame.x = @parent.x + @margin
      when NE, SE
        @frame.x = @parent.x + difference.width - @margin
      when CENTRE
        @frame.x = @parent.x + (difference.width / 2)

    # Y-coordinate
    switch direction
      when NW, NE
        @frame.y = @parent.y + @margin
      when SE, SW
        @frame.y = @parent.y + difference.height - @margin
      when CENTRE
        @frame.y = @parent.y + (difference.height / 2)

    this

  # Resize SE-corner by factor
  resize: (factor) ->
    difference = @difference()
    if factor.width?
      delta = Math.min @parent.width * factor.width, difference.x + difference.width - @margin
      @frame.width += delta
    if factor.height?
      delta = Math.min @parent.height * factor.height, difference.height - @frame.y + @margin + HIDDEN_DOCK_MARGIN
      @frame.height += delta
    this

  # Maximise to fill whole screen
  maximise: ->
    @frame.width = @parent.width - (2 * @margin)
    @frame.height = @parent.height - (2 * @margin)
    this

  # Halve width
  halve: ->
    @frame.width /= 2
    this

  # Fit to screen
  fit: ->
    difference = @difference()
    @maximise() if difference.width < 0 or difference.height < 0
    this

  # Fill relatively to LEFT or RIGHT-side of screen, or fill whole screen
  fill: (direction) ->
    @maximise()
    @halve() if direction in [ LEFT, RIGHT ]
    switch direction
      when LEFT then @to NW
      when RIGHT then @to NE
      else @to NW
    this

# Chain a Window-object
Window::chain = ->
  new ChainWindow this

# To direction in screen
Window::to = (direction, screen) ->
  window = @chain()
  window.screen(screen).fit() if screen?
  window.to(direction).set()

# Fill in screen
Window::fill = (direction, screen) ->
  window = @chain()
  window.screen screen if screen?
  window.fill(direction).set()
  window.to(NE).set() if direction is RIGHT # Ensure position for windows larger than expected

# Resize by factor
Window::resize = (factor) ->
  @chain().resize(factor).set()



# Key Bindings
Key.on 'a', CONTROL_CMD, ->
  window = Window.focused()
  window?.fill null, window.screen().next()

# Fill Bindings
Key.on 'l', CONTROL_CMD, ->
  window = Window.focused()
  window?.fill LEFT, window.screen().next()

Key.on 'r', CONTROL_CMD, ->
  window = Window.focused()
  window?.fill RIGHT, window.screen().next()

# cmd+ctrl+l: move to left half of the screen
# cmd+ctrl+r: move to right have of the screen
# cmd+ctrl+a: fullscreen
# on Helium app launch, resize to small window in the bottom right of the screen
# each command should support multiple screens

# vim:syn=coffee
