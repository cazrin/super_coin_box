class Level
  TILE_WIDTH = 18

  constructor: (game) ->
    @game = game

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
