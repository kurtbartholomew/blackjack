class window.Game extends Backbone.Model

  initialize: ->


  defaults:
    playerWins: 0
    dealerWins: 0
    ties: 0
    gameType: 'Blackjack'

  win: (winner) ->
    if winner is "dealer" then @set 'dealerWins',@get( 'dealerWins' )+ 1
    else if winner is "player" then @set 'playerWins',@get( 'playerWins' )+ 1

  tie: ->
    @set 'ties', @get( 'ties' )+ 1
