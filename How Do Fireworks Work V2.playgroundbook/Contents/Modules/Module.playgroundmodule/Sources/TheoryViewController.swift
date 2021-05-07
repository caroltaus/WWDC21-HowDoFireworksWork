
import UIKit
import SpriteKit

public class TheoryViewController: UIViewController{
    public let scene = TheoryScene()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let view = SKView()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        self.view = view
        //view.showsFPS = true
        //view.showsNodeCount = true
    }
}
