class Level
  constructor: (game, tileWidth) ->
    @platforms = game.add.group()
    @platforms.enableBody = true

    upperLeftWall = @platforms.create 0, 0, 'wall'
    upperLeftWall.body.immovable = true
    upperLeftWall.scale.setTo 11, 1

    upperRightWall = @platforms.create game.world.width - tileWidth*11, 0, 'wall'
    upperRightWall.body.immovable = true
    upperRightWall.scale.setTo 11, 1

    lowerLeftWall = @platforms.create 0, game.world.height - tileWidth, 'wall'
    lowerLeftWall.body.immovable = true
    lowerLeftWall.scale.setTo 11, 1

    lowerRightWall = @platforms.create game.world.width - tileWidth*11, game.world.height - tileWidth, 'wall'
    lowerRightWall.body.immovable = true
    lowerRightWall.scale.setTo 11, 1

    leftWall = @platforms.create 0, tileWidth, 'wall'
    leftWall.body.immovable = true
    leftWall.scale.setTo 1, 18

    rightWall = @platforms.create game.world.width - tileWidth, tileWidth, 'wall'
    rightWall.body.immovable = true
    rightWall.scale.setTo 1, 18

    topPlatform = @platforms.create tileWidth*6, tileWidth*5, 'wall'
    topPlatform.body.immovable = true
    topPlatform.scale.setTo 15, 1

    bottomPlatform = @platforms.create tileWidth*6, game.world.height - tileWidth*5, 'wall'
    bottomPlatform.body.immovable = true
    bottomPlatform.scale.setTo 15, 1

    leftPlatform = @platforms.create tileWidth, tileWidth*9, 'wall'
    leftPlatform.body.immovable = true
    leftPlatform.scale.setTo 5, 1

    rightPlatform = @platforms.create game.world.width - tileWidth*6, tileWidth*9, 'wall'
    rightPlatform.body.immovable = true
    rightPlatform.scale.setTo 5, 1

    @killBox = game.add.sprite 0, game.world.height+tileWidth
    game.physics.enable @killBox, Phaser.Physics.ARCADE
    @killBox.body.immovable = true
    @killBox.body.width = game.world.width
