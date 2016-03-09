//
//  ViewController.swift
//  tapper
//
//  Created by Mike Kimpton on 3/8/16.
//  Copyright © 2016 Fuji America. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    //Properties
    var maxTaps:Int = 0
    var currentTaps:Int = 0
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {

            logoImg.hidden = true
            playButton.hidden = true
            howManyTapsTxt.hidden = true
            
            tapButton.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playButton.hidden = false
        howManyTapsTxt.hidden = false
        
        tapButton.hidden = true
        tapsLabel.hidden = true
       
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        
        return false
    }
}

