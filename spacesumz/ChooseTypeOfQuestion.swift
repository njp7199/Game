//
//  ChooseTypeOfQuestion.swift
//  spacesumz
//
//  Created by apple on 19/04/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit
var choice = 0

class ChooseTypeOfQuestionScene: SKScene{

    let addButton = SKLabelNode(fontNamed: "The Bold Font")
    let subButton = SKLabelNode(fontNamed: "The Bold Font")
    let multButton = SKLabelNode(fontNamed: "The Bold Font")
    let divButton = SKLabelNode(fontNamed: "The Bold Font")
    let mainLabel = SKLabelNode(fontNamed: "The Bold Font")

    override func didMove(to view: SKView) {
    
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
    
        mainLabel.text = "CHOOSE TYPE OF QUESTION"
        mainLabel.fontSize = 80
        mainLabel.fontColor = SKColor.white
        mainLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        mainLabel.zPosition = 1
        mainLabel.name = "mainLabel"
        self.addChild(mainLabel)
    
        addButton.text = "ADDITION"
        addButton.fontSize = 100
        addButton.fontColor = SKColor.white
        addButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.6)
        addButton.zPosition = 1
        addButton.name = "addButton"
        self.addChild(addButton)
    
        subButton.text = "SUBTRACTION"
        subButton.fontSize = 100
        subButton.fontColor = SKColor.white
        subButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        subButton.zPosition = 1
        subButton.name = "subButton"
        self.addChild(subButton)
    
        multButton.text = "MULTIPLICATION"
        multButton.fontSize = 100
        multButton.fontColor = SKColor.white
        multButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        multButton.zPosition = 1
        multButton.name = "multButton"
        self.addChild(multButton)
        
        divButton.text = "DIVISION"
        divButton.fontSize = 100
        divButton.fontColor = SKColor.white
        divButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
        divButton.zPosition = 1
        divButton.name = "divButton"
        self.addChild(divButton)

        let mainMenuLabel = SKLabelNode(fontNamed: "The Bold Font")
        mainMenuLabel.text = "RETURN TO MAIN MENU"
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.fontSize = 90
        mainMenuLabel.zPosition = 1
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        mainMenuLabel.name = "mainMenuLabel"
        self.addChild(mainMenuLabel)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = nodes(at: pointOfTouch)
            
            for node in nodeITapped{
                if node.name == "addButton"{
                    choice = 1
                    addButton.fontColor = SKColor.red
                    
                }else if node.name == "subButton"{
                    choice = 2
                    subButton.fontColor = SKColor.red
                }else if node.name == "multButton"{
                    choice = 3
                    multButton.fontColor = SKColor.red
                }else if node.name == "divButton"{
                    choice = 4
                    divButton.fontColor = SKColor.red
                    
                }else if node.name == "mainMenuLabel"{
                    let sceneToMoveTo = MainMenuScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                }
                
            }
            
        }
    }

}
