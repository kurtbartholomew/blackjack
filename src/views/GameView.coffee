class window.GameView extends Backbone.View
  className: 'game'

  template: _.template '<span class="game-type">GameType: <%= gameType %> </span>' +
    '<span class="player-wins">Player Wins: <%= playerWins %> </span>' +
    '<span class="dealer-wins">Dealer Wins: <%= dealerWins %> </span>' +
    '<span class="ties">Ties: <%= ties%></span>'

  initialize: ->
    @model.on('change', @render, @)
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.toJSON()


  # defaults:
  #   playerWins: 0
  #   dealerWins: 0
  #   ties: 0
  #   gameType: 'Blackjack'
