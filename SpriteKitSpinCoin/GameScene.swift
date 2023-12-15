//
//  GameScene.swift
//  SpriteKitSpinCoin
//
//  Created by Jihun Kang on 2023/12/15.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let imageAtlas = SKTextureAtlas(named: "ring")
        var imageArray = [SKTexture]()
        
        for i in 1...imageAtlas.textureNames.count {
            let kirbyImage = "ring-\(i)"
            imageArray.append(SKTexture(imageNamed: kirbyImage))
        }
        
        for i in 0...132 {
            let sprite = SKSpriteNode(texture: imageAtlas.textureNamed("ring-1"))
            sprite.xScale = 0.35;
            sprite.yScale = 0.35;
            sprite.position = makeNodePosition(index: i)

            let waitToAnimate = SKAction.wait(forDuration: Double(i) * 0.02)
            let actionBlock = SKAction.run{
                let animate = SKAction.animate(with: imageArray, timePerFrame: 0.2)
                let loop = SKAction.repeatForever(animate)
                sprite.run(loop)
            }
            
            let spinByActions = [waitToAnimate,actionBlock]
            let startSequence = SKAction.sequence(spinByActions)
            sprite.run(startSequence)
            
            self.addChild(sprite)
        }
    
    }
    
    func makeNodePosition(index:Int) -> (CGPoint){
        let col = index % 7;
        let row = index / 7;
        let x = col * 50 + 50;
        let y = row * 40 + 50;
        return CGPointMake(CGFloat(x),CGFloat(y))
    }
    
}
