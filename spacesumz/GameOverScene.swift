//
//  GameOverScene.swift
//  spacesumz
//
//  Created by Noah James Petrie on 24/02/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    let restartLabel = SKLabelNode(fontNamed: "The Bold Font")
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "theone")
        background.position = CGPoint(x:self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let goLabel = SKLabelNode(fontNamed: "The Bold Font")
        goLabel.text = "GAME OVER"
        goLabel.fontSize = 210
        goLabel.fontColor = SKColor.white
        goLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.width*0.7)
        goLabel.zPosition = 1
        self.addChild(goLabel)
        
        let sLabel = SKLabelNode(fontNamed: "The Bold Font")
        sLabel.text = "Score: \(questionsanswered)"
        sLabel.fontSize = 130
        sLabel.fontColor = SKColor.white
        sLabel.position = CGPoint(x:self.size.width/2, y:self.size.width*0.55)
        sLabel.zPosition = 1
        self.addChild(sLabel)
        
        restartLabel.text = "Restart"
        restartLabel.fontSize = 90
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y:self.size.height*0.3)
        self.addChild(restartLabel)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch){
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
    }
}
