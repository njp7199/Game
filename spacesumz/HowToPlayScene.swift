//
//  HowToPlayScene.swift
//  spacesumz
//
//  Created by apple on 11/04/2018.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SpriteKit

class HowToPlayScene: SKScene{
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x:self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let howToPlayLabel = SKLabelNode(fontNamed: "The Bold Font")
        howToPlayLabel.text = "HOW TO PLAY"
        howToPlayLabel.fontSize = 100
        howToPlayLabel.fontColor = SKColor.white
        howToPlayLabel.position = CGPoint(x: self.size.width*0.5, y:self.size.height*0.8)
        howToPlayLabel.zPosition = 1
        self.addChild(howToPlayLabel)
        
        let howToPlayText = SKLabelNode(fontNamed: "The Bold Font")
        howToPlayText.text = """
        HOW TO PLAY
        
        Player: The user must answer the questions presented to them
        at the top of the screen. This is doneby tapping on the screen
        when the player node is underneath the enemy node with the correct answer.
        This will send a bullet up into the enemy node and if the answer is correct
        then the user's score will increase by 1.
        
        Enemy: There are four enemies on the screen and each enemy has an answer
        assigned to it. The user must fire a bullet into the enemy node with the
        correct answer and if the user chooses the correct answer then the enemy
        node will be destroyed.
        
        Game: If the user answers three questions incorrectly or misses the correct
        answer due to incorrect aim then the user will lose all their lives and will
        be taken to the game over screen and their game will finish. If the user answers
        ten questions correctly without losing all their lives then the user has won
        and they have completed the game. There is a timer for the user to answer the
        questions within and if they haven't picked the correct answer when the timer
        runs out then they will lose a life.
        """
        howToPlayText.fontSize = 10
        howToPlayText.fontColor = SKColor.white
        howToPlayText.position = CGPoint(x:self.size.width/2, y:self.size.height*0.9)
        howToPlayText.zPosition = 1
        self.addChild(howToPlayText)
    }
}
