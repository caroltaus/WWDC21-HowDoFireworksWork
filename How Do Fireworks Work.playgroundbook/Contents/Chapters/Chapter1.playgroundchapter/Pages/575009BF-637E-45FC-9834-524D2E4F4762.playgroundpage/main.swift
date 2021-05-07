//#-hidden-code
import PlaygroundSupport
import Module
let art = ArtViewController()
PlaygroundPage.current.setLiveView(art)


let Metal: Metal

func Sodium() -> Metal{
    return .Sodium
}

func Magnesium() -> Metal{
    return .Magnesium
}

func Potassium() -> Metal{
    return .Potassium
}

func Calcium() -> Metal{
    return .Calcium
}

func Lithium() -> Metal{
    return .Lithium
}

func Boron() -> Metal{
    return .Boron
}

func Barium() -> Metal{
    return .Barium
}

func Arsenic() -> Metal{
    return .Arsenic
}

func Caesium() -> Metal{
    return .Caesium
}

func Copper() -> Metal{
    return .Copper
}

//#-end-hidden-code
/*:
 # Making your own fireworks!
 
 Fireworks are made with metal salts, and, as we now know, different metals will produce different colored lights when they explode.
 
 So now you can try making your own fireworks!
 
 Click on the text field "Choose the metal", then **choose the metal from the code completion bar at the bottom of the page** and run the code, finally, click wherever you want on the screen to make them explode ✨
 
 
 */
//#-code-completion(everything, hide)
//#-code-completion(identifier,show, Copper(), Sodium(), Caesium(), Arsenic(), Barium(), Boron(), Lithium(), Calcium(), Potassium(), Magnesium())
Metal = /*#-editable-code Choose the metal*//*#-end-editable-code*/

//#-hidden-code
art.scene.metal = Metal
//#-end-hidden-code
