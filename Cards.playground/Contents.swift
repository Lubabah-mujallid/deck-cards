import UIKit


struct Card {
   var color: String
   var roll: Int
    init(roll: Int){
        self.roll = roll
        switch self.roll {
        case 1...2: color = "Blue"
        case 3...4: color = "Red"
        case 5...6: color = "Green"
        default: color = "undefined"
        }
    }
}

class Deck {
    var cards: [Card] = []
    init() {
        for _ in 1...10{
            cards.append(Card(roll: Int.random(in: 1...2)))
            cards.append(Card(roll: Int.random(in: 3...4)))
            cards.append(Card(roll: Int.random(in: 5...6)))
        }
    }
    func deal() -> Card {
        return cards.removeLast()
    }
    func isEmpty() -> Bool {
        return cards.isEmpty
    }
    func shuffle() {
        cards.shuffle()
    }
}

class Player {
    var name: String
    var hand: [Card]
    init(name: String, hand: [Card]) {
        self.name = name
        self.hand = hand
    }
    func draw(deck: Deck) -> Card{
        let card = deck.deal()
        hand.append(card)
        return card
    }
    func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
    func matchingCards(color: String, roll: Int) -> Int {
        var count = 0
        for card in hand {
            if card.color == color && card.roll == roll {
                count += 1
            }
        }
        return count
    }
}

let deck = Deck()
deck.shuffle()
let player = Player(name: "Lubabah", hand: [])
for _ in 1...5 {
    player.draw(deck: deck)
}

 

