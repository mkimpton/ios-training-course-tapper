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

            toggleControls()
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func toggleControls() {
        logoImg.hidden = !logoImg.hidden
        playButton.hidden = !playButton.hidden
        howManyTapsTxt.hidden = !howManyTapsTxt.hidden
        
        tapButton.hidden = !tapButton.hidden
        tapsLabel.hidden = !tapsLabel.hidden
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        toggleControls()
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        return false
    }
}

