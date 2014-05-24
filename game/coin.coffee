locations = [
    x: 100
    y: 200
  ,
    x: 50
    y: 50
  ,
    x: 150
    y: 50
  ,
    x: 200
    y: 50
  ,
    x: 300
    y: 50
  ,
    x: 400
    y: 50
  ,
    x: 280
    y: 150
  ,
    x: 400
    y: 240
  ,
    x: 235
    y: 265
]

class Coin extends Phaser.Sprite
  constructor: (game) ->
    super game, 0, 0, 'coin'
    @reset()

    game.physics.arcade.enable @

    @smoothed = false
    game.add.existing @

  reset: ->
    @currentLocation = @randomLocation()
    super @currentLocation.x, @currentLocation.y

  randomLocation: ->
    availableLocations = if @currentLocation then @__locationsWithoutCurrent() else locations
    availableLocations[@game.rnd.integerInRange(0, availableLocations.length-1)]

  __locationsWithoutCurrent: ->
    locations.filter (location) =>
      location != @currentLocation
