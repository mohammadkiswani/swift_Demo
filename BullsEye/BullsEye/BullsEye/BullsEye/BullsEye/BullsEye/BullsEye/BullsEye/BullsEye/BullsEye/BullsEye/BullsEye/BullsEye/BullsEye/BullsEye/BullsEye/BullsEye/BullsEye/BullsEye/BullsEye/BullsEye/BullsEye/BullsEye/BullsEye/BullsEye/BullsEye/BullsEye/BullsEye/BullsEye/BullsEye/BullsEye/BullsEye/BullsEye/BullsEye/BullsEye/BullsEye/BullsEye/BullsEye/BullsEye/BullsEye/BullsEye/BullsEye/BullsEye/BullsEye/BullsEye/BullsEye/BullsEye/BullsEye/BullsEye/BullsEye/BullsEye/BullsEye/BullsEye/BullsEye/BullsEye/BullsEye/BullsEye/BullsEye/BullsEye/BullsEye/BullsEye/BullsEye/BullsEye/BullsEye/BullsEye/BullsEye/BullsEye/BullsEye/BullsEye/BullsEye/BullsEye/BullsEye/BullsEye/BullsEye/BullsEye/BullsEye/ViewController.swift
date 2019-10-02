//
//  ViewController.swift
//  BullsEye
//
//  Created by Mohamed on 8/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

 final class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var  scoreLable: UILabel!
    @IBOutlet weak var roundLable: UILabel!

    // MARK: - Properties
    
    private  var currentValue: Int =  0
    private  var targetValue: Int = 0
    private  var score = 0
    private var round = 0

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value
        currentValue = Int(roundedValue )
        startNewGame()
        
        //        let thumbImageNormal =  #imageLiteral(resourceName: "information")
        //        slider.setThumbImage(thumbImageNormal, for: .normal)
        //        let thumbImageHlighted = #imageLiteral(resourceName: "refrish")
        //        slider.setThumbImage(thumbImageHlighted, for: .highlighted)
        //        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        //        let trackLeftImage = #imageLiteral(resourceName: "IMG_2839")
        //        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets )
        //        slider.setMinimumTrackImage(trackLeftResizeable , for: .normal )
        //        let trackRightImage = #imageLiteral(resourceName: "111111")
        //        let trackRightResizeable = trackRightImage .resizableImage(withCapInsets: insets )
        //        slider.setMaximumTrackImage(trackRightResizeable, for: .normal )
    }

    // MARK: - Interactions
    
    @IBAction private func sliderMoved (_  slider: UISlider ) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue )
    }
    
    @IBAction func startNewGame () {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let difference = abs (currentValue - targetValue)
        var point = 100 - difference
        score +=  difference
        let title: String
        if difference == 0 {
            title = "Perfect"
            point += 100
            
        }
        else if difference < 5 {
            title = " you almost had it "
            if difference == 1 {
                point += 50
            }
        }
        else if difference < 10 {
            title = "Pretty Good "}
            
        else {
            title = " not even close ..."
        }
        
        let message = "Youe Scored is : \(point) point \(currentValue)"
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default , handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action )
        
        present(alert, animated: true ,completion: nil )
    }

    
    
//    <<...OPIRATION...>>
    
  private func startNewRound() {
        round += 1
        targetValue = Int.random( in: 1...100  )
//        currentValue = 50
        slider.value = Float(currentValue)
        upDateLables() 
    }
  private func upDateLables(){
        targetLable.text = String(targetValue)
        scoreLable.text = String(score)
        roundLable.text = String(round)
    }
    
}

