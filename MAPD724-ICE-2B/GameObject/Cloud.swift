//
//  Island.swift
//  MAPD724-ICE-2B
//
//  Created by Parth Maru on 2023-01-29.
//

import GameplayKit
import SpriteKit

class Cloud: GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //lifecylce function
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 //transperncy
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -902 )
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomainze the verticle speed
        verticleSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0 //speed of 5 to 10
        
        // randomaize the horizontal speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0 //speed of -2 to 2
        position.y = 876
        // get random number for x position
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        // get random number for y position
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    //public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticleSpeed!
    }
}
