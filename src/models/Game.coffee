class window.Game extends Backbone.Model

  initialize: (options) ->
    @set 'mainApp', options.mainApp #options.mainApp is "this" for app

  defaults:
    playerWins: 0
    dealerWins: 0
    ties: 0
    gameType: 'Blackjack'

  win: ->
    @set 'playerWins',@get( 'playerWins' ) + 1
    @resolveGame()

  lose: ->
    @set 'dealerWins',@get( 'dealerWins' ) + 1
    @resolveGame()

  tie: ->
    @set 'ties', @get( 'ties' ) + 1
    @resolveGame()

  checkFinal: ->
    appInstance = @get 'mainApp'

    playerScores = appInstance.get('playerHand').scores()
    dealerScores = appInstance.get('dealerHand').scores()

    playerScore = _.max(playerScores)
    dealerScore = _.max(dealerScores)

    if playerScore > dealerScore #win
      @.win()
    else if playerScore < dealerScore #lose
      @.lose()
    else
      @.tie()

  resolveGame: ->
    console.log("Resolving...")
    @trigger 'over' #'over' is the event being triggered

