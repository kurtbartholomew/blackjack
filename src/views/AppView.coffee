class window.AppView extends Backbone.View
  template: _.template '
    <div class="game-status"></div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('dealerHand').stand()
      @model.get('playerHand').stand()
      @model.get('game').checkFinal()

  initialize: ->
    @render()

  render: -> #similar to .html('') cleanup
    @$el.children().detach() #wipes clean inside the $el div
    @$el.html @template()
    @$('.game-status').html new GameView(model: @model.get 'game').el
    # $el is the DOM node wrapped in jquery; el is the DOM node (no wrapper)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

