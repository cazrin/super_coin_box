class Coin extends Phaser.Sprite
  constructor: (game) ->
    super game, 100, 200, 'coin'

    game.physics.arcade.enable @

    game.add.existing @
