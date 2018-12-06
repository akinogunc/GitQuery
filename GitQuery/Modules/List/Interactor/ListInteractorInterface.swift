//
//  ListInteractorInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func sendNetworkRequest(query: String)
}

protocol ListInteractorOutput {
    func responseDataFetched()
}
