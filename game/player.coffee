class Player extends Phaser.Sprite
  constructor: (game, x, y) ->
    super game, x, y, 'player'

    @smoothed = false

    @animations.add 'left', [0, 1], 10, true
    @animations.add 'right', [3, 4], 10, true

    game.physics.arcade.enable @
    @body.gravity.y = 600

    game.add.existing @

  moveLeft: ->
    @body.velocity.x = -200
    @animations.play 'left'

  moveRight: ->
    @body.velocity.x = 200
    @animations.play 'right'

  stopMoving: ->
    @animations.stop()
    @frame = 2

  jump: ->
    @body.velocity.y = -350
