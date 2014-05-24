class GameOver
  init: (score) ->
    @score = score

  create: ->
    @game.add.tileSprite 0, 0, @game.world.width, @game.world.height, 'background'
    @game.add.text 140, 50, 'Super Coin Box',
      fill: '#FFF'

    @game.add.text 160, 130, "score: #{@score}\nbest score: 0",
      align: 'center'
      fill: '#FFF'

    @game.add.text 50, 260, 'press the up arrow key to start',
      fill: '#FFF'
