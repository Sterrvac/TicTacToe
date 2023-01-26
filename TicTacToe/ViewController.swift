//
//  ViewController.swift
//  TicTacToe
//
//  Created by macbook on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var TurnLable: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Cross
    var secondTurn = Turn.Cross
    
    var nought = "O"
    var cross = "X"
    
    var board = [UIButton]()
    
    var noughtScore = 0
    var crossScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func TopAction(_ sender: UIButton) {
        addToBoarn(sender)
        
        if checkForVictory(cross) {
            crossScore += 1
            resultAlert(title: "Crosses Win")
        }
        
        if checkForVictory(nought) {
            noughtScore += 1
            resultAlert(title: "Noughts Win")
        }
        
        if fullBoard() {
            resultAlert(title: "Drow")
        }
    }
    
    func checkForVictory(_ s: String) -> Bool {
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String) {
        let message = "Noughts " + String(noughtScore) + "\nCrosses " + String(crossScore)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Result", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(alert, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil ,for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            TurnLable.text = cross
        } else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            TurnLable.text = nought
        }
        secondTurn = firstTurn
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func addToBoarn(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (secondTurn == Turn.Nought) {
                sender.setTitle(nought, for: .normal)
                secondTurn = Turn.Cross
                TurnLable.text = cross
            } else if (secondTurn == Turn.Cross) {
                sender.setTitle(cross, for: .normal)
                secondTurn = Turn.Nought
                TurnLable.text = nought
            }
            sender.isHidden = false
        }
    }
    
}

