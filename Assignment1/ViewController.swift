//
//  ViewController.swift
//  Assignment1
//
//  Created by RobinWu on 2020-03-06.
//  Copyright © 2020 RobinWu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true

    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: UIButton) {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true) {
            gameState[sender.tag-1] = activePlayer
            if(activePlayer == 1) {
                sender.setImage(UIImage(named: "cross.jpeg"), for: UIControl.State())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named:"circle.jpeg"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    for i in 0...2 {
                        let button = view.viewWithTag(combination[i]+1) as! UIButton
                        button.setImage(UIImage(named: "redCross.png"), for: UIControl.State())
                    }
                    print("cross")//cross won
                    label.text = "CROSS HAS WON!"
                }
                else {
                    for i in 0...2 {
                        let button = view.viewWithTag(combination[i]+1) as! UIButton
                        button.setImage(UIImage(named: "redCircle.png"), for: UIControl.State())
                    }
                    print("circle")//circle won
                    label.text = "CIRCLE HAS WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }

        if gameIsActive == true
        {
            gameIsActive = false
            for i in gameState {
                if i == 0{
                    gameIsActive = true
                }
            }
            
            if gameIsActive == false
            {
                label.text = "DRAW!"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }

    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

