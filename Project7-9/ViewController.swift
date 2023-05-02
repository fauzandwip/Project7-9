//
//  ViewController.swift
//  Project7-9
//
//  Created by Fauzan Dwi Prasetyo on 02/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var currentAnswer: UILabel!
    var submitButton: UIButton!
    var arrayData = [String]()
    var usedLetters = [String]()
    
    var life = 8 {
        didSet {
            title = "Life: \(life)"
        }
    }
    
    var score = 0 {
        didSet {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: \(score)")
        }
    }
    
    var word = "RHYTHM" {
        didSet {
            DispatchQueue.main.async {
                self.currentAnswer.text! = String(repeating: "?", count: self.word.count)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Life: \(life)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: \(score)")
        
        currentAnswer = UILabel()
        currentAnswer.text = "????????"
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.font = UIFont.systemFont(ofSize: 36)
        currentAnswer.numberOfLines = 1
        view.addSubview(currentAnswer)
        
        submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Guess", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .blue
        submitButton.titleLabel?.numberOfLines = 1
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        submitButton.layer.cornerRadius = 20
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            // currentAnswer
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // submitButton
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 50),
            submitButton.centerXAnchor.constraint(equalTo: currentAnswer.centerXAnchor)
        ])
           
        loadData()
    }
    
    @objc func loadData() {
        if let urlString = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let data = try? String(contentsOf: urlString) {
                arrayData = data.components(separatedBy: "\n")
                word = arrayData[0].uppercased()
            }
        }
    }
    
}

