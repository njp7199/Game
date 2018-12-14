//  GameScene.swift
//  spacesumz
//
//  Created by apple on 19/07/2017.
//  Copyright © 2017 apple. All rights reserved.
//
import SpriteKit
import GameplayKit
var questionsanswered = 0
var currentquestion = 0
var currentanswer = 0




class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    let player = SKSpriteNode(imageNamed: "Spaceship")
    
    var amountoflives = 3
    let scorelab = SKLabelNode(fontNamed: "The Font")
    let TimeLabel = SKLabelNode(fontNamed: "The Font")
    let livelab = SKLabelNode(fontNamed: "The Font")
    
    

    enum gameState {
        case preg // state before the game
        case ing  // state during the game
        case afterg // state after the game
    }
    
    var currentState = gameState.ing
    
    struct PhysicsCategories{
        static let None : UInt32 = 0
        static let Player: UInt32 = 0b1
        static let Bullet: UInt32 = 0b10
        static let Alienhead: UInt32 = 0b100
    }
    
    
    var gameArea: CGRect
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playablewidth = size.height/maxAspectRatio
        let margin = (size.width-playablewidth)/2
          gameArea = CGRect(x: margin, y: 0, width: playablewidth, height: size.height)
        
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    

    var counter = 0
    var counterTime = Timer()
    
    var counterStartValue = 10

    func startCounter(){
        
        counterTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
    }
    
    @objc func decrementCounter(){
        counter -= 1
        TimeLabel.text = "\(counter)"
    }
    
    
    
    override func didMove(to view: SKView) {
        
        questionsanswered = 0
        
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1{
            let stars = SKSpriteNode(imageNamed: "theone")
            stars.size = self.size
            stars.anchorPoint = CGPoint(x: 0.5, y: 0)
            stars.position = CGPoint(x: self.size.width/2, y: self.size.height*CGFloat(i))
            stars.name = "Stars"
            stars.zPosition = 0
            self.addChild(stars)
        }
    
        
        
        //SCORE LABEL!!
        
        
        scorelab.text = "Questions Solved: 0"
        scorelab.fontSize = 40
        scorelab.fontColor = SKColor.white
        //
        // The label starts at the left and expands to the right, locking to the left
        scorelab.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scorelab.position = CGPoint(x: self.size.width*0.16, y: self.size.height*0.9)
        scorelab.zPosition = 2
        self.addChild(scorelab)
        
        
        // TIMER
        
        TimeLabel.fontSize = 50
        TimeLabel.text = "\(counterStartValue)"
        TimeLabel.position.x = size.width*0.2
        TimeLabel.position.y = size.height*0.1
        TimeLabel.zPosition = 5
        TimeLabel.fontColor = UIColor.white
        self.addChild(TimeLabel)
        
        if difficulty == 1{
            counterStartValue = 10
        } else if difficulty == 2{
            counterStartValue = 8
        } else if difficulty == 3{
            counterStartValue = 6
        }
        
        counter = counterStartValue
        startCounter()
        
        if counter <= 0{
            counterTime.invalidate()
        }
        
        // LIVES LABEL
        
        livelab.text = "Lives remaining: 3"
        livelab.fontSize = 40
        livelab.fontColor = SKColor.white
        
        livelab.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livelab.position = CGPoint(x: self.size.width*0.84, y: self.size.height*0.9)
        livelab.zPosition = 6
        self.addChild(livelab)
        
        
        player.setScale(0.5)
        
        
        let startpoint = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        
        if currentState == gameState.ing{
        let moveLeft = SKAction.move(to: CGPoint(x: self.size.width*0.2, y:self.size.height*0.2), duration:2)
        let moveRight = SKAction.move(to: CGPoint(x: self.size.width*0.8, y:self.size.height*0.2), duration: 2)
        
        player.run(SKAction.repeatForever(SKAction.sequence([moveLeft, moveRight])))
        }
        
        
        player.position = startpoint
        // This line above sets the position of ship, 0.2 is dividing the postion by
        //5 so that the player starts 20% of the way up the screen
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = PhysicsCategories.Player
        player.physicsBody!.collisionBitMask = PhysicsCategories.None
        player.physicsBody!.contactTestBitMask = PhysicsCategories.Alienhead
        self.addChild(player)
        
      
        startNewLevel()
        
    }
    
    var lastUpdateTimeCount: TimeInterval = 0
    var deltaFrameTimeCount: TimeInterval = 0
    var amountToMovePerSec: CGFloat = 500.0
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTimeCount == 0{
            lastUpdateTimeCount = currentTime
        }
        else{
            deltaFrameTimeCount = currentTime - lastUpdateTimeCount
            lastUpdateTimeCount = currentTime
        }
        let amountToMoveBackground = amountToMovePerSec * CGFloat(deltaFrameTimeCount)
        
        self.enumerateChildNodes(withName: "Stars"){
            stars, stop in
            stars.position.y -= amountToMoveBackground
            if stars.position.y < -self.size.height{
                stars.position.y += self.size.height*2
                
            }
        }
    }
    
    
    func scoreadd(){
        
        questionsanswered += 1
        scorelab.text = "Questions Solved: \(questionsanswered)"
        let getBigscore = SKAction.scale(to: 1.3, duration: 0.3)
        let getSmallscore = SKAction.scale(to: 1, duration: 0.3)
        let getsequence = SKAction.sequence([getBigscore,getSmallscore])
        scorelab.run(getsequence)
        
        if questionsanswered >= 10 {
            changeSceneGameWon()
        }
        
    }
    

    
    
    func removelife(){
        amountoflives -= 1
        livelab.text = "Lives remaining: \(amountoflives)"
        let getBiglives = SKAction.scale(to: 1.3, duration: 0.3)
        let getSmalllives = SKAction.scale(to: 1, duration: 0.3)
        let getsequence = SKAction.sequence([getBiglives,getSmalllives])
        livelab.run(getsequence)
        
        if amountoflives == 0{
            gameOver()
        }
    }
    
    func gameOver(){
        
        currentState = gameState.afterg
        self.removeAllActions()
        self.enumerateChildNodes(withName: "Bullet"){
            bullet, stop in
            bullet.removeAllActions()
        }
        self.enumerateChildNodes(withName: "Alienhead"){
            alienhead, stop in
            alienhead.removeAllActions()
        }
        
        let changeSceneAction = SKAction.run(changeSceneGameOver)
        let waitToChange =  SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChange, changeSceneAction])
        self.run(changeSceneSequence)
    }
    
   
    func createQuestion(){
        let num1 = 3
        let num2 = 4
        let answer = num1 * num2
        let question = "\(num1),x,\(num2)"

        let questions = ["\(question)","\(question)","\(question)"]
        let questionlabel = SKLabelNode (fontNamed: "The Font")
        questionlabel.text = "\(questions[currentquestion])"
        questionlabel.fontSize = 60
        questionlabel.fontColor = SKColor.white
        questionlabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        questionlabel.zPosition = 8
        self.addChild(questionlabel)
        
        let answerlabel = SKLabelNode(fontNamed: "The Font")
        answerlabel.text = "\(answer)"
        answerlabel.fontSize = 60
        answerlabel.fontColor = SKColor.white
        answerlabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.82)
        answerlabel.zPosition = 8
        self.addChild(answerlabel)
        
        
        
    }
        
    
    
    func changeSceneGameOver(){
    
        let sceneToMove = GameOverScene(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.6)
        self.view!.presentScene(sceneToMove, transition: myTransition)
    }
    
    func changeSceneGameWon(){
        let sceneToMove = GameWonScene(size:self.size)
        sceneToMove.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.6)
        self.view!.presentScene(sceneToMove, transition: myTransition)
    }
    
    func gameWon(){
        
        currentState = gameState.afterg
        self.removeAllActions()
        self.enumerateChildNodes(withName: "Bullet"){
            bullet, stop in
            bullet.removeAllActions()
        }
        self.enumerateChildNodes(withName: "Alienhead"){
            alienhead, stop in
            alienhead.removeAllActions()
        }
        
        let changeSceneAction = SKAction.run(changeSceneGameWon)
        let waitToChange =  SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChange, changeSceneAction])
        self.run(changeSceneSequence)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else{
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if body1.categoryBitMask == PhysicsCategories.Bullet && body2.categoryBitMask == PhysicsCategories.Alienhead{
            
            if body2.node != nil {
                spawnexplosion(spawnPosition: body2.node!.position)
                createQuestion()
                }else {
                removelife()
            }
            
            scoreadd()
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            startNewLevel()

        }
        
    }
    
    func spawnexplosion(spawnPosition: CGPoint){
        let explosion = SKSpriteNode(imageNamed: "bang")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 1.3, duration: 0.1)
        let fadeout = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionsequence = SKAction.sequence([scaleIn, fadeout, delete])
        explosion.run(explosionsequence)
    }
    
    
    func spawnEnemy(){
        let alienhead = SKSpriteNode(imageNamed: "alien")
        alienhead.name = "Alienhead"
        alienhead.setScale(1.1)
        alienhead.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        alienhead.zPosition = 2
        alienhead.physicsBody = SKPhysicsBody(rectangleOf: alienhead.size)
        alienhead.physicsBody!.affectedByGravity = false
        alienhead.physicsBody!.categoryBitMask = PhysicsCategories.Alienhead
        alienhead.physicsBody!.collisionBitMask = PhysicsCategories.None
        alienhead.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Bullet
        self.addChild(alienhead)
        
    }
    
    func startNewLevel(){
        let wait = SKAction.wait(forDuration: 0.2)
        let spawn = SKAction.run(spawnEnemy)
        let sequence = SKAction.sequence([wait, spawn])
        self.run(sequence)
        createQuestion()
    }
    
    func firebullet(){
        
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.name = "Bullet"
        bullet.setScale(1)
        bullet.position = player.position
        bullet.zPosition = 1
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody!.affectedByGravity = false
        bullet.physicsBody!.categoryBitMask = PhysicsCategories.Bullet
        bullet.physicsBody!.collisionBitMask = PhysicsCategories.None
        bullet.physicsBody!.contactTestBitMask = PhysicsCategories.Alienhead
        self.addChild(bullet)
        
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let loselife = SKAction.run(removelife)
        let bulletSequence = SKAction.sequence([moveBullet, deleteBullet, loselife])
        bullet.run(bulletSequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentState == gameState.ing{
        firebullet()
        }
    }
}


