//
//  ViewController.swift
//  TicTac
//
//  Created by Anastasia Dobrova on 2021-01-12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winner: UILabel!
    @IBOutlet var startView: UIView!
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var run: UIButton!
    @IBOutlet weak var whoNext: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var scoreFirst: UILabel!
    @IBOutlet weak var scoreSec: UILabel!
    
    
    
    var game = true
    var active = 1 // cross
    var position = [0,0,0,0,0,0,0,0,0]
    let victory = [[0,1,2], [0,3,6,], [6,7,8],[3,4,5],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var first = "First player"
    var second = "Second player"
    var score1 = 0
    var score2 = 0
    
    
    
    func starting() {
        run.layer.cornerRadius = 10
        run.layer.shadowOpacity = 0.3
        run.layer.shadowColor = UIColor.black.cgColor
        run.layer.shadowRadius = 5
        playBtn.layer.cornerRadius = 10
        playBtn.layer.shadowOpacity = 0.3
        playBtn.layer.shadowColor = UIColor.black.cgColor
        playBtn.layer.shadowRadius = 5
        
        
    }
    
    
    
    
    @IBAction func run(_ sender: UIButton) {
        player1.isHidden = true
        player2.isHidden = true
        startView.isHidden = true
        run.isHidden = true
        whoNext.isHidden = false
        first = player1.text!
        second = player2.text!
        
        scoreFirst.text = "\(score1)"
        scoreSec.text = "\(score2)"
        
        if first == "" {first = "First player"}
        if second == "" {second = "Second player"}
        name1.text = first
        name2.text = second
        whoNext.text = "\(first)'s turn"
        UIView.transition(from: startView, to: view, duration: 1, options: [.curveEaseOut,.transitionFlipFromTop, .showHideTransitionViews])
    
    }
    

    
    @IBAction func clicked(_ sender: AnyObject)
        {
            if (position [sender.tag-1] == 0 && winner.isHidden == true && game == true) {
                position[sender.tag-1] = active
                if (active == 1) {
                    active = 2
                    sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                    whoNext.text = "\(second)'s turn"
                } else {
                    sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                    whoNext.text = "\(first)'s turn"
                    active = 1
                }
            }

        
        
        for combs in victory {
            if position[combs[0]] != 0 && position[combs[0]]  == position[combs[1]]  && position[combs[1]] == position[combs[2]]  {
                game = false
                whoNext.isHidden = true
                if position[combs[0]] == 1 {
                    winner.text = "\(String(describing: first)) won!"
                    score1 += 1
                } else {
                    winner.text = "\(String(describing: second)) won!"
                    score2 += 1
                }
                game = false
                scoreFirst.text = "\(score1)"
                scoreSec.text = "\(score2)"
                whoNext.isHidden = true
                playBtn.isHidden = false
                winner.isHidden = false
            }
        }
        game = false
        
        for i in position
            {
            if i == 0 {
                game = true
                break
            }
        }
        if game == false && winner.isHidden == true {
            
            winner.text = "\(first) and \(second) played a draw"
            whoNext.isHidden = true
            playBtn.isHidden = false
            winner.isHidden = false
        
        }
        
        
    }
    
    @IBOutlet var playBtn: UIButton!
    @IBAction func play(_ sender: Any) {
        position = [0,0,0,0,0,0,0,0,0]
        game = true
        active = 1
        playBtn.isHidden = true
        winner.isHidden = true
        whoNext.isHidden = false
        whoNext.text = "\(first)'s turn"
        UIView.transition(from: view, to: view, duration: 1, options: [.curveEaseOut,.transitionFlipFromTop, .showHideTransitionViews])
        
        
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starting()
    }


}

