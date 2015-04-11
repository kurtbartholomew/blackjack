class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('dealerHand').stand()
      @model.get('playerHand').stand()
      @model.checkFinal()

  initialize: ->
    @render()

  render: -> #similar to .html('') cleanup
    @$el.children().detach() #wipes clean inside the $el div
    @$el.html @template()
    # $el is the DOM node wrapped in jquery; el is the DOM node (no wrapper)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

