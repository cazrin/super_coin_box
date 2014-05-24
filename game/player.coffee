class Player extends Phaser.Sprite
  constructor: (game, x, y) ->
    super game, x, y, 'player'

    @smoothed = false

    @animations.add 'left', [0, 1], 10, true
    @animations.add 'right', [3, 4], 10, true

    game.physics.arcade.enable @
    @body.gravity.y = 600
    @anchor.setTo 0.5

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

  collectCoin: ->
    @game.add.tween(@scale).to { x: 1.2, y: 1.2 }, 100, Phaser.Easing.Linear.None, true, 0, false, true
