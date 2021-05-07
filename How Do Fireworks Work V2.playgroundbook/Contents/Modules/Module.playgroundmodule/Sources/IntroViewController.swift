
import UIKit
import SpriteKit

public class IntroViewController: UIViewController{
    public let scene = IntroScene()
    
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
