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

###
  - Give user 2 cards
  - while score <= 21
    - Display cards
    - If under 21
      - ask hit or stay
    - else if == 21
      - Blackjack!
    - else
      - Bust
###
console.log "Welcome to Blackjack!"
console.log "=====================\n"

# Deal a new hand
myHand = [deal(), deal()]

# start score at 0
score = 0

stdin = process.openStdin()
stdin.setEncoding 'utf8'

prompt = (text) ->
  console.log text
  res = ""
  stdin.on 'data', (input) ->
    input = input.trim()
    if input == 'hit' or input == 'Hit'
      res = "Hit"
    else if input == 'stay' or input == 'Stay'
      res = "Stay"
    else
      res = "Error"
  return res

while score <= 21
  console.log "Your cards:"
  console.log card.getCardName() for card in myHand
  score += card.getValue() for card in myHand
  console.log score
  if score < 21
    res = prompt("Would you like to hit or stay?")
    # if res == "hit" or res == "Hit"
      # myHand.push deal()
  else if score == 21
    console.log "Blackjack! You Win!"
    break
  else if score > 21
    console.log "Bust! You lose!"
    break
