//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    
    // MARK: - Public properties
    var answers = [Answer]()
    
    
    // TODO
    // 1. Передать сюда массив с ответами +
    // 2. Определить наиболее часто встречающийся тип животного +
    // 3. Отобразить результат в соответсвии с этим живтным +
    // 4. Избавится от кнопки возврата назад на экран результатов +

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let animalTypeResult = getRepeatAnimalResult(answers: &answers).first
        if let title = animalTypeResult?.rawValue {
            titleLabel.text = "Вы - \(title)"
        }
        
        if let desctiption = animalTypeResult?.definition {
            discriptionLabel.text = desctiption
        }
    }
}

// MARK: - Private methods

extension ResultsViewController {
    private func getRepeatAnimalResult(answers: inout [Answer]) -> [AnimalType] {
        var lastAnimal: AnimalType?
        var animalsType: [AnimalType] = []
        
        answers.sort { $0.type.rawValue < $1.type.rawValue }
        
        for answer in answers {
            if lastAnimal == answer.type {
                animalsType.append(answer.type)
            }
            lastAnimal = answer.type
        }
        
            return animalsType
    }
}
