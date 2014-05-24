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

    @helpText = @game.add.text @game.world.width/2, 260, 'press the space bar to start',
      fill: '#FFF'

    @helpText.anchor.setTo 0.5
    @helpTextAngleIncrease = 0.3

    @game.input.keyboard.addKeyCapture [Phaser.Keyboard.SPACEBAR]

  update: ->
    if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR
      @game.state.start 'game'

    if @helpText.angle >= 6 || @helpText.angle <= -6
      @helpTextAngleIncrease *= -1

    @helpText.angle += @helpTextAngleIncrease
