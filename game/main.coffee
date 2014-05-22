TILE_WIDTH = 18

collectCoin = ->
  @coin.kill()

preload = ->
  @load.image 'wall', 'assets/wall.png'
  @load.image 'enemy', 'assets/enemy.png'
  @load.image 'coin', 'assets/coin.png'
  @load.spritesheet 'player', 'assets/player.png', 18, 18

create = ->
  @physics.startSystem Phaser.Physics.ARCADE
  @cursors = @input.keyboard.createCursorKeys()

  @stage.backgroundColor = '#5C9CD4'

  @level = new Level @game, TILE_WIDTH
  @player = new Player @game, 32, @world.height-48
  @enemy = new Enemy @game, @world.width/2 - TILE_WIDTH, 10, 'left'
  @coin = new Coin @game

update = ->
  @physics.arcade.collide @player, @level.platforms
  @physics.arcade.collide @enemy, @level.platforms
  @physics.arcade.overlap @player, @coin, collectCoin, null, @

  @player.body.velocity.x = 0

  if @cursors.left.isDown
    @player.moveLeft()
  else if @cursors.right.isDown
    @player.moveRight()
  else
    @player.stopMoving()

  if @cursors.up.isDown and @player.body.touching.down
    @player.jump()

new Phaser.Game TILE_WIDTH*27 , TILE_WIDTH*18, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
