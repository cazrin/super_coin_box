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

    @platforms = @game.add.group()
    @platforms.enableBody = true

    upperLeftWall = @platforms.create 0, 0, 'wall'
    upperLeftWall.body.immovable = true
    upperLeftWall.scale.setTo 11, 1

    upperRightWall = @platforms.create @game.world.width - TILE_WIDTH*11, 0, 'wall'
    upperRightWall.body.immovable = true
    upperRightWall.scale.setTo 11, 1

    lowerLeftWall = @platforms.create 0, @game.world.height - TILE_WIDTH, 'wall'
    lowerLeftWall.body.immovable = true
    lowerLeftWall.scale.setTo 11, 1

    lowerRightWall = @platforms.create @game.world.width - TILE_WIDTH*11, @game.world.height - TILE_WIDTH, 'wall'
    lowerRightWall.body.immovable = true
    lowerRightWall.scale.setTo 11, 1

    leftWall = @platforms.create 0, TILE_WIDTH, 'wall'
    leftWall.body.immovable = true
    leftWall.scale.setTo 1, 18

    rightWall = @platforms.create @game.world.width - TILE_WIDTH, TILE_WIDTH, 'wall'
    rightWall.body.immovable = true
    rightWall.scale.setTo 1, 18

    topPlatform = @platforms.create TILE_WIDTH*6, TILE_WIDTH*5, 'wall'
    topPlatform.body.immovable = true
    topPlatform.scale.setTo 15, 1

    bottomPlatform = @platforms.create TILE_WIDTH*6, @game.world.height - TILE_WIDTH*5, 'wall'
    bottomPlatform.body.immovable = true
    bottomPlatform.scale.setTo 15, 1

    leftPlatform = @platforms.create TILE_WIDTH, TILE_WIDTH*9, 'wall'
    leftPlatform.body.immovable = true
    leftPlatform.scale.setTo 5, 1

    rightPlatform = @platforms.create @game.world.width - TILE_WIDTH*6, TILE_WIDTH*9, 'wall'
    rightPlatform.body.immovable = true
    rightPlatform.scale.setTo 5, 1

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
    @game.physics.arcade.collide @player, @platforms

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
