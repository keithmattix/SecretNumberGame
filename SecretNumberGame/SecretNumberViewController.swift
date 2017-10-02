//
//  SecretNumberViewController.swift
//  SecretNumberGame
//
//  Created by Keith Mattix on 9/23/17.
//  Copyright © 2017 Keith Mattix. All rights reserved.
//

import UIKit

class SecretNumberViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var guessLabel: UILabel!

    @IBOutlet weak var guessButton: UIButton!
    
    @IBOutlet weak var numberOfGuessesLabel: UILabel!
    
    @IBOutlet weak var numberSlider: UISlider!
    
    @IBOutlet weak var feedbackLabel: UILabel!

    @IBOutlet weak var feedbackImage: UIImageView!
    
    var currentNumber: Int?
    
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextButton.isHidden = true
        guessLabel.text = String(format: "%.0f", numberSlider.value)
        generateNumber()
        
    }
    
    @IBAction func updateGuess(_ sender: UISlider) {
        guessLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    
    @IBAction func submitGuess(_ sender: UIButton) {
        numberOfGuesses += 1
        numberOfGuessesLabel.text = numberOfGuesses.description
        let guess = Int(guessLabel.text!)
        if let number = currentNumber {
            if guess == number {
                feedbackImage.image = UIImage(named: "correct")
                feedbackLabel.text = "Correct! You guessed the number!"
                guessButton.isHidden = true;
                nextButton.isHidden = false;
            } else if guess! < number {
                feedbackImage.image = UIImage(named: "incorrect")
                feedbackLabel.text = "Too low! Guess a higher number"
            } else {
                // Guess was too high
                feedbackImage.image = UIImage(named: "incorrect")
                feedbackLabel.text = "Too high! Guess a lower number"
            }
        }
    }
    
    func generateNumber(){
        let sliderMax = arc4random_uniform(UInt32(numberSlider.maximumValue))
        currentNumber = Int(sliderMax)
    }
    
    @IBAction func nextNumber(_ sender: UIButton) {
        feedbackLabel.text = "Guess a number between 1 and 100"
        generateNumber()
        nextButton.isHidden = true
        guessButton.isHidden = false
        numberOfGuesses = 0
        numberOfGuessesLabel.text = "0"
        feedbackImage.image = nil
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
