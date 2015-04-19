# Card class
Card = (suit, number) ->
  _suit = suit
  _number = number

  # Getters for number and suit
  @getNumber = -> _number
  @getSuit   = -> _suit

  @getValue = ->
    switch _number
      when 11, 12, 13 then 10
      when 1 then 11
      else _number

  # Get ASCII values of suits
  @getSuitAscii = ->
    { 1: 5, 2: 6, 3: 3, 4: 4 }[_suit]

  @getCardName = ->
    title = switch _number
      when 1  then "Ace"
      when 11 then "Jack"
      when 12 then "Queen"
      when 13 then "King"
      else number.toString()
    "#{title} #{String.fromCharCode(@getSuitAscii())}"

  return this

# Deal function, deals a new card
deal = ->
  # Pick a random suit
  suit   = Math.floor(Math.random() * 4 + 1)

  # Pick a random card number
  number = Math.floor(Math.random() * 13 + 1)

  # Call constructor
  new Card(suit, number)

# Deal cards
card1 = deal()
card2 = deal()


# Hand class
Hand = ->
  cards = []

  @draw = ->
    cards.push deal()

  @score = ->
    sum = 0
    sum += card.getValue() for card in cards
    sum

  return this
