//
//  ExitAppScene.swift
//  spacesumz
//
//  Created by apple on 14/04/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit

class ExitAppScene: SKScene{
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let exitLabel = SKLabelNode(fontNamed: "The Bold Font")
        exitLabel.text = "ARE YOU SURE YOU WANT TO EXIT"
        exitLabel.fontSize =  50
        exitLabel.fontColor = SKColor.white
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        exitLabel.zPosition = 1
        self.addChild(exitLabel)
        
        let yLabel = SKLabelNode(fontNamed: "The Bold Font")
        yLabel.text = "YES"
        yLabel.fontSize = 100
        yLabel.fontColor = SKColor.white
        yLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.5)
        yLabel.zPosition = 1
        yLabel.name = "yLabel"
        self.addChild(yLabel)
        
        let nLabel = SKLabelNode(fontNamed: "The Bold Font")
        nLabel.text = "NO"
        nLabel.fontSize = 100
        nLabel.fontColor = SKColor.white
        nLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        nLabel.zPosition = 1
        nLabel.name = "nLabel"
        self.addChild(nLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = nodes(at: pointOfTouch)
            
            for node in nodeITapped{
                if node.name == "yLabel"{
                    exit(0)
                } else if node.name == "nLabel"{
                    let sceneToMoveTo = MainMenuScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
            }
        }
    }
}
