create = ->
  text = "-phaser -\n with a sprinkle of \n pixi dust."
  style = { font: "65px Arial", fill: "#ff0044", align: "center" }

  t = game.add.text game.world.centerX-300, 0, text, style

game = new Phaser.Game 800, 600, Phaser.CANVAS, 'phaser-example', { create: create }
