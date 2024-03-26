//
//  GameService.swift
//  GameForNoobs
//
//  Created by f f on 04.03.2024.
//

import Foundation

class GameService {
    func getCards() -> [GameCardModel] {
        [
            GameCardModel(cardName: "Cat_1", type: .cat),
            GameCardModel(cardName: "Cat_2", type: .cat),
            GameCardModel(cardName: "Cat_3", type: .cat),
            GameCardModel(cardName: "Cat_4", type: .cat),
            GameCardModel(cardName: "Cat_5", type: .cat),
            GameCardModel(cardName: "Cat_6", type: .cat),
            GameCardModel(cardName: "NotCat_1", type: .dog),
            GameCardModel(cardName: "NotCat_2", type: .dog),
            GameCardModel(cardName: "NotCat_3", type: .bobr),
            GameCardModel(cardName: "NotCat_4", type: .doll)
        ]
    }
    
    func getDonationsCards() -> [DonationCardModel] {
        [
            DonationCardModel(donationName: "вконтактик", type: .vk),
            DonationCardModel(donationName: "дать деняк", type: .cash),
            DonationCardModel(donationName: "спасти киви-банк", type: .qiwi),
            DonationCardModel(donationName: "подписка", type: .twitch),
            DonationCardModel(donationName: "патреон", type: .patreon),
            DonationCardModel(donationName: "поцелуйчик", type: .kiss)
        ]
    }
}
