class Enemy extends Phaser.Sprite
  constructor: (game, x, y, direction) ->
    super game, x, y, 'enemy'

    @direction = 'left'

    game.physics.arcade.enable @
    @body.gravity.y = 600
    @checkWorldBounds = true
    @outOfBoundsKill = true

    game.add.existing @

  update: ->
    if @direction and @body.touching.down
      @body.velocity.x = -100
      delete @direction

    if @body.touching.left
      @body.velocity.x = 100
    else if @body.touching.right
      @body.velocity.x = -100
