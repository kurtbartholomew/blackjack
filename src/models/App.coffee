# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', game = new Game()

  checkFinal: ->
    playerScores = @get('playerHand').scores()
    dealerScores = @get('dealerHand').scores()

    playerScore = _.max(playerScores)
    dealerScore = _.max(dealerScores)

    if playerScore > dealerScore #win
      @get('game').win('player')
    else if playerScore < dealerScore #lose
      @get('game').win('dealer')
    else
      @get('game').tie()
