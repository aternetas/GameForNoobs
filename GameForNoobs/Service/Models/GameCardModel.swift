//
//  GameCardModel.swift
//  GameForNoobs
//
//  Created by f f on 04.03.2024.
//

import Foundation

struct GameCardModel {
    let id = UUID().uuidString
    let cardName: String
    let type: CardType
}

enum CardType: String, CaseIterable {
    case cat = "кот", dog = "пёс", doll = "кукла", bobr = "бобр"
}

