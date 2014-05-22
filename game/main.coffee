class SuperCoinBox
  TILE_WIDTH = 18

  constructor: ->
    @game = new Phaser.Game TILE_WIDTH*27 , TILE_WIDTH*18, Phaser.AUTO, '',
      preload: @preload
      create: @create
      update: @update

  preload: ->
    @game.load.image 'wall', 'assets/wall.png'
    @game.load.spritesheet 'player', 'assets/player.png', 18, 18

  create: ->
    @game.physics.startSystem Phaser.Physics.ARCADE

    @background = @game.add.graphics 0, 0
    @background.beginFill 0x5C9CD4, 1
    @background.drawRect 0, 0, @game.world.width, @game.world.height

    @level = new Level @game

    @player = @game.add.sprite 32, @game.world.height - 48, 'player'
    @player.animations.add 'left', [0, 1], 10, true
    @player.animations.add 'right', [3, 4], 10, true

    @game.physics.arcade.enable @player
    @player.body.gravity.y = 600
    @player.checkWorldBounds = true
    @player.outOfBoundsKill = true

    @player.events.onKilled.add =>
      @player.reset 32, @game.world.height - 48

    @cursors = @game.input.keyboard.createCursorKeys()

  update: ->
    @game.physics.arcade.collide @player, @level.platforms

    @player.body.velocity.x = 0

    if @cursors.left.isDown
        @player.body.velocity.x = -200
        @player.animations.play 'left'
    else if @cursors.right.isDown
      @player.body.velocity.x = 200
      @player.animations.play 'right'
    else
      @player.animations.stop()
      @player.frame = 2

    if @cursors.up.isDown and @player.body.touching.down
      @player.body.velocity.y = -350

new SuperCoinBox()
