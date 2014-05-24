score = 0
highScore = 0
enemyDirection = 'left'

class Game
  create: ->
    @physics.startSystem Phaser.Physics.ARCADE
    @cursors = @input.keyboard.createCursorKeys()

    @stage.backgroundColor = '#5C9CD4'

    @level = new Level @game, TILE_WIDTH
    @player = new Player @game, 32, @world.height-48
    @enemies = @game.add.group()
    @coin = new Coin @game
    @score = @game.add.text 25, 25, @scoreText(),
      fill: '#FFF'
    @score.font = 'Arial'
    @score.fontSize = 20
    @score.fontWeight = 'bold'

    @createEnemy()
    @game.time.events.loop 3000, @createEnemy, @

  update: ->
    @physics.arcade.collide @player, @level.platforms
    @physics.arcade.collide @enemies, @level.platforms
    @physics.arcade.overlap @player, @coin, @collectCoin, null, @
    @physics.arcade.overlap @player, @enemies, @playerDied, null, @
    @physics.arcade.overlap @player, @level.killBox, @playerDied, null, @

    @player.body.velocity.x = 0

    if @cursors.left.isDown
      @player.moveLeft()
    else if @cursors.right.isDown
      @player.moveRight()
    else
      @player.stopMoving()

    if @cursors.up.isDown and @player.body.touching.down
      @player.jump()

  scoreText: ->
    "score: #{score}"

  createEnemy: ->
    enemy = new Enemy @game, @world.width/2 - TILE_WIDTH, 10, enemyDirection
    @enemies.add enemy
    enemyDirection = if enemyDirection == 'left' then 'right' else 'left'

  collectCoin: ->
    @coin.kill()

    score += 5
    @score.text = @scoreText()

    @coin.reset()

  playerDied: ->
    highScore = if score > highScore then score else highScore
    @player.kill()
    @game.state.start 'gameOver', true, false, score, highScore
