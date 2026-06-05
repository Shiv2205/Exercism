package blackjack

func ParseCard(card string) int {
	switch card {
	case "two": return 2
	case "three": return 3
	case "four": return 4
	case "five": return 5
	case "six": return 6
	case "seven": return 7
	case "eight": return 8
	case "nine": return 9
	case "ten", "jack", "queen", "king": return 10
	case "ace": return 11
	default: return 0
	}
}

func FirstTurn(card1, card2, dealerCard string) string {
	cards := []int{ParseCard(card1), ParseCard(card2)}
	dealerHand := ParseCard(dealerCard)

	myHand := cards[0] + cards[1]
	switch {
	case myHand == 22: return "P"
	case myHand >= 17 && myHand <= 20: return "S"
	case myHand <= 11: return "H"
	case myHand >= 12 && myHand <= 16: if dealerHand >= 7 { return "H" } else { return "S" }
	case myHand == 21: if dealerHand >= 10 { return "S" } else { return "W" }
	default: return "S"
	}
}
