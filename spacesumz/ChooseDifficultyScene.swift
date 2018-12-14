//
//  ChooseDifficultyScene.swift
//  spacesumz
//
//  Created by apple on 14/04/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit
var difficulty = 0

class ChooseDifficultyScene: SKScene{
    
    let easyButton = SKLabelNode(fontNamed: "The Bold Font")
    let mediumButton = SKLabelNode(fontNamed: "The Bold Font")
    let hardButton = SKLabelNode(fontNamed: "The Bold Font")
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let mainLabel = SKLabelNode(fontNamed: "The Bold Font")
        mainLabel.text = "CHOOSE DIFFICULTY"
        mainLabel.fontSize = 100
        mainLabel.fontColor = SKColor.white
        mainLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        mainLabel.zPosition = 1
        self.addChild(mainLabel)
        
        easyButton.text = "EASY"
        easyButton.fontSize = 100
        easyButton.fontColor = SKColor.white
        easyButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        easyButton.zPosition = 1
        easyButton.name = "easyButton"
        self.addChild(easyButton)
        
        mediumButton.text = "MEDIUM"
        mediumButton.fontSize = 100
        mediumButton.fontColor = SKColor.white
        mediumButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        mediumButton.zPosition = 1
        mediumButton.name = "mediumButton"
        self.addChild(mediumButton)
        
        hardButton.text = "HARD"
        hardButton.fontSize = 100
        hardButton.fontColor = SKColor.white
        hardButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
        hardButton.zPosition = 1
        hardButton.name = "hardButton"
        self.addChild(hardButton)
        
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
                if node.name == "easyButton"{
                    difficulty = 1
                    easyButton.fontColor = SKColor.red
                
                }else if node.name == "mediumButton"{
                        difficulty = 2
                        mediumButton.fontColor = SKColor.red
                }else if node.name == "hardButton"{
                            difficulty = 3
                            hardButton.fontColor = SKColor.red
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

