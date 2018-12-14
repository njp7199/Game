//
//  GameWonScene.swift
//  spacesumz
//
//  Created by apple on 11/04/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit

class GameWonScene: SKScene{
    let mainMenuLabel = SKLabelNode(fontNamed: "The Bold Font")

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let conLabel = SKLabelNode(fontNamed: "The Bold Font")
        conLabel.text = "CONGRATULATIONS"
        conLabel.fontSize =  100
        conLabel.fontColor = SKColor.white
        conLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        conLabel.zPosition = 1
        self.addChild(conLabel)
        
        let sLabel = SKLabelNode(fontNamed: "The Bold Font")
        sLabel.text = "Score: \(questionsanswered)"
        sLabel.fontSize = 130
        sLabel.fontColor = SKColor.white
        sLabel.position = CGPoint(x:self.size.width/2, y:self.size.width*0.55)
        sLabel.zPosition = 1
        self.addChild(sLabel)
        
        mainMenuLabel.text = "RETURN TO MAIN MENU"
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.fontSize = 90
        mainMenuLabel.zPosition = 1
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        self.addChild(mainMenuLabel)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if mainMenuLabel.contains(pointOfTouch){
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
}
}

