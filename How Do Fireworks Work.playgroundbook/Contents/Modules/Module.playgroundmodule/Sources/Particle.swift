
import SpriteKit

public class Particle {
    var x: CGFloat {
        set { // fun para settar o x e passar o valor para shape
            shape.position.x = newValue
        }
        get {
            return shape.position.x
        }
    }
    var y: CGFloat {
        set { // fun para settar o y e passar o valor para shape
            shape.position.y = newValue
        }
        get {
            return shape.position.y
        }
        
    }
    var color: UIColor
    var radius: CGFloat
    var vx: CGFloat
    var vy: CGFloat
    private var alpha: CGFloat
    lazy var shape: SKNode = getShape() // nao tem valor até você chamar ela
    var tempoVida: TimeInterval
    
    init() {
        color = #colorLiteral(red: 0.8494978547096252, green: 0.4541133642196655, blue: 0.9648899435997009, alpha: 1.0)
        radius = 2
        vx = 0
        vy = 0
        alpha = 100
        tempoVida = 1
        x = 0
        y = 0
    }
    
    init(x: CGFloat, y: CGFloat, radius: CGFloat, color: UIColor, vx: CGFloat, vy: CGFloat, alpha: CGFloat, tempoVida: TimeInterval) {
        self.color = color
        self.radius = radius
        self.vx = vx
        self.vy = vy
        self.alpha = alpha
        self.tempoVida = tempoVida
        self.x = x
        self.y = y
    }
    
    private func getShape() -> SKShapeNode {
        var node: SKShapeNode = SKShapeNode(circleOfRadius: self.radius)
        node.lineWidth = 0
        node.fillColor = self.color
        node.alpha = self.alpha
        node.blendMode = .alpha
        return node
    }
}
