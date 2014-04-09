
# ~~~~~ METHOD SECTION ~~~~~~~

# Deals a random card to player and dealer
def hit(deck)
  rand_card = deck.sample  # pulls a random card from the playing deck.
  deck.delete(rand_card)
end

# Converts card abbreviation to verbose name.
def verbose(card)
  suits  = {H: 'Hearts', C: 'Clubs', D: 'Diamonds', S: 'Spades'}
  royals = {K: 'King', Q: 'Queen', J: 'Jack', A: 'Ace'}
  card_val  = card[0..-2]
  card_suit = card[-1]
  card_suit = suits[card_suit.to_sym] # Converts abreviation to suit name.
  if card_val.to_i == 0               # checks for royals
    royal = royals[card_val.to_sym]
    "#{royal} of #{card_suit}"
  else                                # numerical cards
    "#{card_val} of #{card_suit}"
  end
end

# Starting deal, 2 cards each to dealer and player.
def init_deal(play_deck, dealer_hand, player_hand)
  for i in 1..2
  dealer_hand << hit(play_deck)
  player_hand << hit(play_deck)
  end
end

# Calculates the total value of a hand.
def card_total(hand)
  total = 0
  ace = hand.select {|x| x[0] == 'A'}
  # Calculation of hand without aces.
  if ace == []
    hand.each do |x|
      x = x[0..-2].to_i
      x == 0? total += 10 : total += x
    end
    total
  else
  # Calculation of hand with ace(s)
    # Delete aces from hand array
    ace.each do |a|
      hand.each {|x| hand.delete(a) if x == a}
    end
    # Calculate hand without aces
    hand.each do |x|
      x = x[0..-2].to_i
      x == 0? total += 10 : total += x
    end
    hand += ace # concatenate ace array
    # Add the value of ace(s) to the current total
    nr_ace = ace.length
    case nr_ace
    when 1
      total <= 10? total += 11 : total += 1
    when 2
      total <= 9? total += 12 : total += 2
    when 3
      total <= 8? total += 13 : total += 3
    else
      total <= 7? total += 14 : total += 4
    end
   total 
  end
end

def greeting(name) # remove this...
  puts "Hi #{name} enter '1' to start or '2' to cancel."
  gets.chomp
end

deck = 
  ['KH', 'QH', 'JH', 'AH', '2H', '3H','4H',
   '5H', '6H', '7H', '8H', '9H', '10H',
   'KC', 'QC', 'JC', 'AC', '2C', '3C','4C',
   '5C', '6C', '7C', '8C', '9C', '10C',
   'KD', 'QD', 'JD', 'AD', '2D', '3D','4D',
   '5D', '6D', '7D', '8D', '9D', '10D',
   'KS', 'QS', 'JS', 'AS', '2S', '3S','4S',
   '5S', '6C', '7S', '8S', '9S', '10S',]

play_deck = []

# Game Intro
puts "Please enter your preferred name."
name = gets.chomp
resp = greeting(name) # returns 1 or 2

case resp
when '1' then resp
when '2' then puts "Bye #{name} please come again!"
else puts "Please enter either '1' or '2'."
end

while resp == '1'
  deck.each {|x| play_deck << x} # Initialize playing deck
  player_hand = []
  dealer_hand = []

  # First deal
  init_deal(play_deck, dealer_hand, player_hand)
  puts "Dealer\'s hand:"
  puts "Hidden, " + verbose(dealer_hand[1])
  puts
  puts "#{name}\'s hand:"
  player_hand.each {|x| print verbose(x) + ', '}
  puts
  puts

  # Calculate if players card is 21 blackjack
  if card_total(player_hand) == 21 
    puts "Blackjack! You win!!" # Done!
  else
    puts "Would you like to 'hit' or 'stay'?"
    resp = gets.chomp
    while resp.downcase == 'hit'
      player_hand << hit(play_deck)
      puts "Dealer\'s hand:"
      puts "Hidden, " + verbose(dealer_hand[1])
      puts
      puts "#{name}\'s hand:"
      player_hand.each {|x| print verbose(x) + ', '}
      puts
      puts

      if card_total(player_hand) > 21
        puts "You bust! Dealer wins"
        resp == 'bust'
        break
      else
        puts "Would you like to 'hit' or 'stay'?" # amend this for potential keying errors
        resp = gets.chomp
      end
    end # while end
    
    if resp == 'stay'
      puts "Dealer flips her card and reveals her hand:"
      dealer_hand.each {|x| print verbose(x) + ', '}
      puts
      while card_total(dealer_hand) < 17
        puts "Dealer hits"
        dealer_hand << hit(play_deck)
        puts
        puts "Dealer\'s hand:"
        dealer_hand.each {|x| print verbose(x) + ', '}
        puts
        puts
        puts "#{name}\'s hand:"
        player_hand.each {|x| print verbose(x) + ', '}
        puts
        puts
        if card_total(dealer_hand) > 21
          break
        end
      end
        if card_total(dealer_hand) > 21
          puts "Dealer bust! You win!"
        elsif card_total(dealer_hand) >= card_total(player_hand)
          puts "Dealer wins!"
        else
          puts "Congratulations! You win!"
        end
    end
  end
  # End
  puts "Enter '1' to play again or '2' to exit."
  resp = gets.chomp
end

