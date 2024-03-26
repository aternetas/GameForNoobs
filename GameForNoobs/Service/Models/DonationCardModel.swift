//
//  DonationCardModel.swift
//  GameForNoobs
//
//  Created by f f on 25.03.2024.
//

import Foundation

struct DonationCardModel {
    let donationName: String
    let type: DonationType
}

enum DonationType: String, CaseIterable {
    case vk = "vk", kiwi = "kiwi", cash = "cash", twitch = "twitch", patreon = "patreon", kiss = "kiss"
}
