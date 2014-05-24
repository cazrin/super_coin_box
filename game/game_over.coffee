class GameOver
  init: (score, highScore) ->
    @score = score
    @highScore = highScore

  create: ->
    @game.add.tileSprite 0, 0, @game.world.width, @game.world.height, 'background'
    @game.add.text 140, 50, 'Super Coin Box',
      fill: '#FFF'

    @game.add.text 160, 130, "score: #{@score}\nbest score: #{highScore}",
      align: 'center'
      fill: '#FFF'

    @game.add.text 50, 260, 'press the up arrow key to start',
      fill: '#FFF'
