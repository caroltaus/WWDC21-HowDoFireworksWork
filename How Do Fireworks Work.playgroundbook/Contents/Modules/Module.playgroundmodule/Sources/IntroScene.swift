
import SpriteKit

public class IntroScene: SKScene{
    
    var eu: SKSpriteNode = SKSpriteNode(imageNamed: "eu_2.png") 
    var roxo: SKSpriteNode = SKSpriteNode(imageNamed: "roxo_00.png") 
    var verde: SKSpriteNode = SKSpriteNode(imageNamed: "verde_00.png")
    var quest: SKSpriteNode = SKSpriteNode(imageNamed: "quest_0.png")
    
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.002338165882974863, green: 0.009786221198737621, blue: 0.09203027933835983, alpha: 1.0)
        var position: CGPoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
    }
    
    public override func didChangeSize(_ oldSize: CGSize) {
        self.removeAllChildren() 
        
        var altura = self.size.height
        var largura = self.size.width 
        
        
        eu.setScale(altura/3000)
        eu.position = CGPoint(x: largura/2, y: eu.size.height/2)
        self.addChild(eu) 
        
        quest.setScale(altura/3500)
        quest.position = CGPoint(x: largura/2, y: eu.size.height + quest.size.height/2.5)
        self.addChild(quest)
        
        
        roxo.setScale(altura/3300)
        roxo.position = CGPoint(x: largura/4, y: altura/4*3) 
        self.addChild(roxo)
        
        verde.setScale(altura/4600)
        verde.position = CGPoint(x: largura/4*3, y: altura/5*3) 
        self.addChild(verde)
        
        let textures: [SKTexture] = [SKTexture(imageNamed: "roxo_00.png"), SKTexture(imageNamed: "roxo_01.png"), SKTexture(imageNamed: "roxo_02.png"), SKTexture(imageNamed: "roxo_03.png"), SKTexture(imageNamed: "roxo_04.png"), SKTexture(imageNamed: "roxo_05.png"), SKTexture(imageNamed: "roxo_06.png"), SKTexture(imageNamed: "roxo_07.png"), SKTexture(imageNamed: "roxo_08.png"), SKTexture(imageNamed: "roxo_09.png")] 
        
        for t in textures {
            t.filteringMode = .nearest
        }
        
        let aniFogos = SKAction.animate(with: textures, timePerFrame: 0.2)
        
        let loop = SKAction.repeatForever(aniFogos)
        
        roxo.run(loop)
        
        let textures2: [SKTexture] = [SKTexture(imageNamed: "verde_09.png"), SKTexture(imageNamed: "verde_00.png"), SKTexture(imageNamed: "verde_01.png"), SKTexture(imageNamed: "verde_02.png"), SKTexture(imageNamed: "verde_03.png"), SKTexture(imageNamed: "verde_04.png"), SKTexture(imageNamed: "verde_05.png"), SKTexture(imageNamed: "verde_06.png"), SKTexture(imageNamed: "verde_07.png"), SKTexture(imageNamed: "verde_08.png"), SKTexture(imageNamed: "verde_09.png")] 
        
        for t in textures2 {
            t.filteringMode = .nearest
        }        
        
        let aniFogos2 = SKAction.animate(with: textures2, timePerFrame: 0.2)
        
        let loop2 = SKAction.repeatForever(aniFogos2)
        
        verde.run(loop2)
        
        
        let textures3: [SKTexture] = [SKTexture(imageNamed: "quest_0.png"), SKTexture(imageNamed: "quest_1.png"), SKTexture(imageNamed: "quest_2.png")]
        
        
        for t in textures3 {
            t.filteringMode = .nearest
        }        
        
        let aniQuest = SKAction.animate(with: textures3, timePerFrame: 0.2)
        
        let loop3 = SKAction.repeatForever(aniQuest)
        
        quest.run(loop3)
        
    }
    
        
    }
    
    
