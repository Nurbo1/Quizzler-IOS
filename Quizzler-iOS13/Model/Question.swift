//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Нурбол Мухаметжан on 19.10.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    let text: String
    let answer: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
