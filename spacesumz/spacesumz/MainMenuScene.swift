//
//  MainMenuScene.swift
//  spacesumz
//
//  Created by apple on 13/03/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    let startGame = SKLabelNode(fontNamed: "The Bold Font")
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameName = SKLabelNode(fontNamed: "The Bold Font")
        gameName.text = "spacesumz"
        gameName.fontSize = 100
        gameName.fontColor = SKColor.white
        gameName.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.8)
        gameName.zPosition = 1
        self.addChild(gameName)
        
        let startGame = SKLabelNode(fontNamed: "The Bold Font")
        startGame.text = "START GAME"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.6)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
        
        let exitApp = SKLabelNode(fontNamed: "The Bold Font")
        exitApp.text = "EXIT"
        exitApp.fontSize = 100
        exitApp.fontColor = SKColor.white
        exitApp.position = CGPoint(x:self.size.width/2, y: self.size.height*0.3)
        exitApp.zPosition = 1
        exitApp.name = "exitApp"
        self.addChild(exitApp)
        
        let chooseDifficulty = SKLabelNode(fontNamed: "The Bold Font")
        chooseDifficulty.text = "CHOOSE DIFFICULTY"
        chooseDifficulty.fontSize = 100
        chooseDifficulty.fontColor = SKColor.white
        chooseDifficulty.zPosition = 1
        chooseDifficulty.position = CGPoint(x:self.size.width/2, y:self.size.height*0.4)
        chooseDifficulty.name = "chooseDifficulty"
        self.addChild(chooseDifficulty)
        
        let chooseQuestion = SKLabelNode(fontNamed: "The Bold Font")
        chooseQuestion.text = "CHOOSE TYPE OF QUESTION"
        chooseQuestion.fontSize = 80
        chooseQuestion.fontColor = SKColor.white
        chooseQuestion.zPosition = 1
        chooseQuestion.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        chooseQuestion.name = "chooseQuestion"
        self.addChild(chooseQuestion)
        
        let howToPlay = SKLabelNode(fontNamed: "The Bold Font")
        howToPlay.text = "HOW TO PLAY"
        howToPlay.fontSize = 100
        howToPlay.fontColor = SKColor.white
        howToPlay.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        howToPlay.zPosition = 1
        howToPlay.name = "howToPlayButton"
        self.addChild(howToPlay)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = nodes(at: pointOfTouch)
            
            for node in nodeITapped{
                if node.name == "startButton"{
                    
                    let sceneToMoveTo = GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                } else if node.name == "howToPlayButton"{
                    let sceneToMoveTo = HowToPlayScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                } else if node.name == "chooseQuestion"{
                    let sceneToMoveTo = ChooseTypeOfQuestionScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                    
                } else if node.name == "chooseDifficulty"{
                    let sceneToMoveTo = ChooseDifficultyScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                } else if node.name == "exitApp"{
                    let sceneToMoveTo = ExitAppScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                
                
        }
    }
}
}
