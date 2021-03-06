class Enemy extends Phaser.Sprite
  constructor: (game, x, y, direction) ->
    super game, x, y, 'enemy'

    @direction = direction

    game.physics.arcade.enable @
    @body.gravity.y = 600
    @checkWorldBounds = true

    @events.onOutOfBounds.add =>
      @kill()

    game.add.existing @

  update: ->
    if @direction and @body.touching.down
      @body.velocity.x = if @direction == 'left' then -100 else 100
      delete @direction

    if @body.touching.left
      @body.velocity.x = 100
    else if @body.touching.right
      @body.velocity.x = -100
