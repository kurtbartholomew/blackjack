# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', game = new Game({ mainApp : @ })
    @get('playerHand').on 'bust', ->
      @get('game').lose()
    ,@
    @get('dealerHand').on 'bust', ->
      @get('game').win()
    ,@
    # @get('game').on 'over', ->
    #
    # ,@
