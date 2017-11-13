//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    var currentStory = ""
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(storyText: story1, buttonTop: answer1a, buttonBottom: answer1b)
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        nextStory(tag: sender.tag)
    }
    
    func updateUI(storyText: String, buttonTop: String, buttonBottom: String)
    {
        storyTextView.text = storyText
        topButton.setTitle(buttonTop, for: .normal)
        bottomButton.setTitle(buttonBottom, for: .normal)
        
        //updateCurrentStory
        currentStory = storyText
    }
    
    func updateUI(storyText: String)
    {
        storyTextView.text = storyText
        currentStory = storyText
    }
    
    func nextStory(tag: Int)
    {
        if tag == 1
        {
            if currentStory == story1
            {
                updateUI(storyText: story3, buttonTop: answer3a, buttonBottom: answer3b)
            }
            else if currentStory == story2
            {
                updateUI(storyText: story3, buttonTop: answer3a, buttonBottom: answer3b)
            }
            else if currentStory == story3
            {
                updateUI(storyText: story6)
                promptRestart()
            }
            else
            {
                reset()
            }
        }
        else if tag == 2
        {
            if currentStory == story1
            {
                updateUI(storyText: story2, buttonTop: answer2a, buttonBottom: answer2b)
            }
            else if currentStory == story2
            {
                updateUI(storyText: story4)
                promptRestart()
            }
            else if currentStory == story3
            {
                updateUI(storyText: story5)
                promptRestart()
            }
            else
            {
                reset()
            }
        }
    }
    
    func reset()
    {
        topButton.isHidden = false
        updateUI(storyText: story1, buttonTop: answer1a, buttonBottom: answer1b)
    }
    
    func promptRestart()
    {
        topButton.isHidden = true
        bottomButton.setTitle("Restart", for: .normal)
    }


}

