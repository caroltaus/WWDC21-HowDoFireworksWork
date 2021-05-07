import SpriteKit

public enum Metal {
    case Sodium, Magnesium, Potassium, Calcium, Lithium, Boron, Barium, Arsenic, Caesium, Copper 
    public var color: UIColor {
        switch self {
        case .Sodium: 
            return #colorLiteral(red: 1.0005275011062622, green: 0.8605864644050598, blue: 0.01278805173933506, alpha: 1.0)
        case .Magnesium:
            return #colorLiteral(red: 0.9961728453636169, green: 0.990250289440155, blue: 1.0007249116897583, alpha: 1.0)
        case .Potassium:
            return #colorLiteral(red: 0.8494978547096252, green: 0.4541133642196655, blue: 0.9648899435997009, alpha: 1.0)
        case .Calcium:
            return #colorLiteral(red: 1, green: 0.3263098001, blue: 0, alpha: 1)
        case .Lithium:
            return #colorLiteral(red: 0.924031674861908, green: 0.10829377919435501, blue: 0.12640324234962463, alpha: 1.0)
        case .Boron:
            return #colorLiteral(red: 0.1874300241470337, green: 0.9684489369392395, blue: 0.6407588124275208, alpha: 1.0)
        case .Barium:
            return #colorLiteral(red: 0.7207609415054321, green: 0.920099139213562, blue: 0.5441333651542664, alpha: 1.0)
        case .Arsenic:
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case .Caesium:
            return #colorLiteral(red: 0.6135720610618591, green: 0.5482574701309204, blue: 0.9705256819725037, alpha: 1.0)
        case .Copper:
            return #colorLiteral(red: 0.3217654824256897, green: 0.7736356854438782, blue: 0.779019832611084, alpha: 1.0)
            }
    }
}
