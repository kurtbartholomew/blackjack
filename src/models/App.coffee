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
    if playerScores > dealerScores #win
      @get('game').win('player')
    else if playerScores < dealerScores #lose
      @get('game').win('dealer')
    else
      @get('game').tie()
