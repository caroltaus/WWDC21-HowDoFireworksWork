import UIKit
import SpriteKit

public class TheoryScene: SKScene{
    var bot: SKSpriteNode = SKSpriteNode(imageNamed: "fosforo.png") 
    var el1: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var el2: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var el3: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var rOrb1: CGFloat = 100
    var rOrb2: CGFloat = 150
    var rOrb3: CGFloat = 200
    var currentRadius: CGFloat = 150
    var center: CGPoint = CGPoint()
    var angle: CGFloat = 0
    var angle2: CGFloat = CGFloat.pi
    var angle3: CGFloat = 200
    var nucl: SKSpriteNode = SKSpriteNode(imageNamed: "nucl.png") 
    
    var luz: SKSpriteNode = SKSpriteNode(imageNamed: "luz_0.png")
    var luz2: SKSpriteNode = SKSpriteNode(imageNamed: "luz_0.png")
    
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            // configurando eletrons
        el1.fillColor = #colorLiteral(red: 0.3248277307, green: 0.8369095325, blue: 0.9915711284, alpha: 1.0)
        el2.fillColor = #colorLiteral(red: 0.3248277307, green: 0.8369095325, blue: 0.9915711284, alpha: 1.0)
        el3.fillColor = #colorLiteral(red: 0.3248277307, green: 0.8369095325, blue: 0.9915711284, alpha: 1.0)
        el1.lineWidth = 0
        el2.lineWidth = 0
        el3.lineWidth = 0
        
    }
    
    public override func didChangeSize(_ oldSize: CGSize) {
        
        // ponto central da tela
        center = CGPoint(x: size.width/2, y: size.height/2)
        
        
        var altura = self.size.height
        var largura = self.size.width
        
        nucl.setScale(altura/1500)
        nucl.position = CGPoint(x: self.size.width/2 , y: self.size.height/2)
        
        // configurando botão
        bot.name = "button"
        bot.setScale(altura/5600)
        bot.position = CGPoint(x: largura/2, y: bot.size.height/2)
        
        // configurando luz1
        luz.setScale(altura/3500)
        luz.position = CGPoint(x: largura/4, y: altura - luz2.size.height/2)
        
        // configurando luz2
        luz2.setScale(altura/3500)
        luz2.position = CGPoint(x: largura/4*3, y: altura - luz2.size.height/2)
        
        draw()
    }
    
    
    func draw() {
        self.removeAllChildren()
        
        self.addChild(nucl) 
        
            // caminho do orbital 1
        var c1 = SKShapeNode(circleOfRadius: rOrb1)
        c1.position = center
        addChild(c1)
        
        // caminho do orbital 2
        var c2 = SKShapeNode(circleOfRadius: rOrb2)
        c2.position = center
        addChild(c2)
        
        // caminho do orbital 3
        var c3 = SKShapeNode(circleOfRadius: rOrb3)
        c3.position = center
        addChild(c3)
        
        //adicionando eletrons a cena
        addChild(el1)
        addChild(el2)
        addChild(el3)
        
        //adicionando botão
        addChild(bot)
        
        // adicionando luz
        addChild(luz)
        addChild(luz2)
    }    
    
    // Função que muda o eletron de orbita
    func changeOrb(){
        if currentRadius == rOrb2{
            // mudando pro porbital 3
            currentRadius = rOrb3
            
                // animação fosforo
            let textures: [SKTexture] = [SKTexture(imageNamed: "fogo_0.png"), SKTexture(imageNamed: "fogo_1.png"), SKTexture(imageNamed: "fogo_2.png"), SKTexture(imageNamed: "fogo_3.png"), SKTexture(imageNamed: "fogo_4.png"), SKTexture(imageNamed: "fogo_5.png")] 
            
            for t in textures {
                t.filteringMode = .nearest
            }
            
            let aniFosf = SKAction.animate(with: textures, timePerFrame: 0.2)
            
            let loop = SKAction.repeatForever(aniFosf)
            bot.run(loop)
            
            let aumenta = SKAction.scale(to: 1.0, duration: 0.3)
            let diminui = SKAction.scale(to: 0.90, duration: 0.3)
            let repete = SKAction.repeatForever(SKAction.sequence([aumenta,diminui]))
            el3.run(repete)
            
        }
        else {
            // volta pro orbital de origem
            currentRadius = rOrb2
            
            //para fogo
            var altura = self.size.height
            var largura = self.size.width
            bot = SKSpriteNode(imageNamed: "fosforo.png") 
            bot.name = "button"
            bot.setScale(altura/5600)
            bot.position = CGPoint(x: largura/2, y: bot.size.height/2)
            
            // animação luz1
            
            let textures2: [SKTexture] = [SKTexture(imageNamed: "luz_1.png"), SKTexture(imageNamed: "luz_2.png"), SKTexture(imageNamed: "luz_3.png"), SKTexture(imageNamed: "luz_4.png"), SKTexture(imageNamed: "luz_5.png"), SKTexture(imageNamed: "luz_6.png"), SKTexture(imageNamed: "luz_7.png"), SKTexture(imageNamed: "luz_0.png")]       
            
            for t in textures2 {
                t.filteringMode = .nearest
            }
            
            let aniLuz = SKAction.animate(with: textures2, timePerFrame: 0.15)
            
            let loop2 = SKAction.repeat(aniLuz, count: 1)
            
            luz.run(loop2)
            
            
            
            // animação luz2
            
            let textures3: [SKTexture] = [SKTexture(imageNamed: "luz_1.png"), SKTexture(imageNamed: "luz_2.png"), SKTexture(imageNamed: "luz_3.png"), SKTexture(imageNamed: "luz_4.png"), SKTexture(imageNamed: "luz_5.png"), SKTexture(imageNamed: "luz_6.png"), SKTexture(imageNamed: "luz_7.png"), SKTexture(imageNamed: "luz_0.png")]       
            
            for t in textures3 {
                t.filteringMode = .nearest
            }
            
            let aniLuz2 = SKAction.animate(with: textures3, timePerFrame: 0.15)
            
            let loop3 = SKAction.repeat(aniLuz2, count: 1)
            
            luz2.run(loop3)
            
                // faz parar de pulsar
            let aumenta = SKAction.scale(to: 1.0, duration: 0.3)
            let diminui = SKAction.scale(to: 1.0, duration: 0.3)
            let repete = SKAction.repeatForever(SKAction.sequence([aumenta,diminui]))
            el3.run(repete)
        }
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        
        // Atualiza posição dos eletrons
        
        // eletron 1
        el1.position.x = center.x + rOrb1 * cos(angle)
        el1.position.y = center.y + rOrb1 * sin(angle)
        
        // eletron 2
        el2.position.x = center.x + rOrb1 * cos(angle2)
        el2.position.y = center.y + rOrb1 * sin(angle2)
        
        // eletron 3
        el3.position.x = center.x + currentRadius * cos(angle3)
        el3.position.y = center.y + currentRadius * sin(angle3)
        
        angle += 0.01
        angle2 += 0.01
        angle3 += 0.01
        
        
        draw()
    }
    
    
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = self
        if let touch = touches.first {
            let location = touch.location(in: scene)
            let touchedNodes = scene.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "button" {
                    scene.changeOrb()
                }
            }
            
        }
    }
        
    
    
}


