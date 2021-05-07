import SpriteKit

public class ArtScene: SKScene{
    var circles: [Particle] = [] 
    var numCircles: Int = 40
    var particles: [Particle] = []
    var particleTrail: [Particle] = []
    var particleCount: Int = 30
    let maxRadius: CGFloat = 2
    var lastUpdate: TimeInterval = 0
    var lua: SKSpriteNode = SKSpriteNode(imageNamed: "lua.png")
    var predios: SKSpriteNode = SKSpriteNode(imageNamed: "predios_00.png")
    public var metal: Metal = .Potassium
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    public override func didChangeSize(_ oldSize: CGSize) {
        var altura = self.size.height
        var largura = self.size.width 
        
            // Posição da lua
        lua.setScale(altura/3000)
        lua.position = CGPoint(x: self.size.width/4*3 , y: self.size.height-120)
        
            // Posição dos prédios
        predios.setScale(altura/2300)
        predios.position = CGPoint(x:predios.size.width/2.5,y:predios.size.height/2) 
        
        let textures: [SKTexture] = [SKTexture(imageNamed: "predios_00.png"), SKTexture(imageNamed: "predios_01.png"), SKTexture(imageNamed: "predios_02.png"), SKTexture(imageNamed: "predios_03.png"), SKTexture(imageNamed: "predios_04.png"), SKTexture(imageNamed: "predios_05.png"), SKTexture(imageNamed: "predios_06.png"), SKTexture(imageNamed: "predios_07.png"), SKTexture(imageNamed: "predios_08.png"), SKTexture(imageNamed: "predios_09.png")] 
        
        for t in textures {
            t.filteringMode = .nearest
        }
        
        let aniPredios = SKAction.animate(with: textures, timePerFrame: 0.9)
        
        let loop = SKAction.repeatForever(aniPredios)
        
        predios.run(loop)        
        
        
        
        
        draw()
    }
    
    // Adicionando os elementos de bg na cema
    func draw() {
        self.removeAllChildren()
        self.addChild(lua) 
        self.addChild(predios)
    }    
    
    public override func update(_ currentTime: TimeInterval) {
        
        let difTempo = currentTime - lastUpdate
        lastUpdate = currentTime
        
        // removendo as  particles que morreram da lista
        particles =  particles.filter { particle in 
            return particle.tempoVida > 0
        }
        
        // removendo os circles que morreram da lista
        circles =  circles.filter { circle in 
            return circle.tempoVida > 0
        }
        
        
        
        for i in 0..<particles.count {
            particles[i].tempoVida -= difTempo
            
            // matando as particulas que passaram do tempo de vida
            if particles[i].tempoVida <= 0 {
                self.removeChildren(in: [particles[i].shape])
                continue
            }
            
            particles[i].x += particles[i].vx
            particles[i].y += particles[i].vy
            
            var pTrail = Particle(x: particles[i].x, y: particles[i].y, radius: particles[i].radius, color: metal.color, vx: 0, vy: 0, alpha: 0.3, tempoVida: 1)
            particleTrail.append(pTrail)
            self.addChild(pTrail.shape)
            
        }
        
        
        particleTrail =  particleTrail.filter { trail in // trail é um parametro que esta sendo recebido
        return trail.shape.alpha > 0
        }
        
        // i é o index trail é o objeto
        for trail in particleTrail {
            trail.shape.alpha -= 0.015
            
            
            if trail.shape.alpha <= 0 {
                self.removeChildren(in: [trail.shape])
            }
        }
        
        
        
        for i in 0..<circles.count {
            circles[i].tempoVida -= difTempo
            // matando os circles que passaram do tempo de vida
            if circles[i].tempoVida <= 0 {
                self.removeChildren(in: [circles[i].shape])
                continue
            }
            circles[i].x += circles[i].vx // movendo pro lado
            circles[i].y += circles[i].vy // movendo na vertical
        }   
        
        
        
    }
    
    // fun explosion é chamada onde o user clica/toca na tela
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { touch in
            explosion(position: touch.location(in: self), color: metal.color)
        }
    }
    
    // fun explosion cria as pariculas e as coloca na cena
    func explosion(position: CGPoint,color: UIColor){
        
        // criando circles
        for i in 0..<numCircles { 
            
            var vetorVelocidade = velocidade(min: -3, max: 3)
            var c = Particle(x: position.x, 
                            y: position.y, 
                            radius: 1, 
                            color: metal.color, 
                            vx: vetorVelocidade[0], 
                            vy: vetorVelocidade[1], 
                            alpha: 1, 
                            tempoVida: 1)
            
            circles.append(c) // coloca no vetor
            self.addChild(c.shape)
        }        
        
        // criando particulas
        for i in 0..<particleCount {
            var vetorVelocidade = velocidade(min: -3, max: 3)
            var p = Particle(x: position.x,
                             y: position.y, 
                             radius: .random(in: 2...maxRadius), 
                             color: metal.color,
                             vx: vetorVelocidade[0], 
                             vy: vetorVelocidade[1], 
                             alpha: 0.5, 
                             tempoVida: 1)
            particles.append(p)
            self.addChild(p.shape)
        }
    }
    
    // função de velocidade pra deixar as explosões mais redondas
    func velocidade(min: CGFloat, max: CGFloat) -> [CGFloat] {
        
        var velocidade: CGFloat = .random(in: min...max)
        var angulo: CGFloat = .random(in: 0...359)
        
        var vy: CGFloat = velocidade * sin((angulo * CGFloat.pi / 180))
        var vx: CGFloat = velocidade * cos((angulo * CGFloat.pi / 180))
        
        return [vx, vy]
    }
}

