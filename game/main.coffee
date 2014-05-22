class SuperCoinBox
  TILE_WIDTH = 18

  constructor: ->
    @game = new Phaser.Game TILE_WIDTH*27 , TILE_WIDTH*18, Phaser.AUTO, '',
      preload: @preload
      create: @create
      update: @update

  preload: ->
    @game.load.image 'wall', 'assets/wall.png'
    @game.load.image 'enemy', 'assets/enemy.png'
    @game.load.spritesheet 'player', 'assets/player.png', 18, 18

  create: ->
    @game.physics.startSystem Phaser.Physics.ARCADE
    @cursors = @game.input.keyboard.createCursorKeys()

    @game.stage.backgroundColor = '#5C9CD4'

    @level = new Level @game, TILE_WIDTH
    @player = new Player @game, 32, @game.world.height-48
    @enemy = new Enemy @game, @game.world.width/2 - TILE_WIDTH, 10, 'left'

  update: ->
    @game.physics.arcade.collide @player, @level.platforms
    @game.physics.arcade.collide @enemy, @level.platforms

    @player.body.velocity.x = 0

    if @cursors.left.isDown
      @player.moveLeft()
    else if @cursors.right.isDown
      @player.moveRight()
    else
      @player.stopMoving()

    if @cursors.up.isDown and @player.body.touching.down
      @player.jump()

new SuperCoinBox()
