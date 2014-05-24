TILE_WIDTH = 18

preload = ->
  @load.image 'wall', 'assets/wall.png'
  @load.image 'enemy', 'assets/enemy.png'
  @load.image 'coin', 'assets/coin.png'
  @load.image 'background', 'assets/background.png'
  @load.spritesheet 'player', 'assets/player.png', 18, 18

create = ->
  @game.state.start 'game'

game = new Phaser.Game TILE_WIDTH*27 , TILE_WIDTH*18, Phaser.AUTO, '',
  preload: preload
  create: create

game.state.add 'game', Game
game.state.add 'gameOver', GameOver
