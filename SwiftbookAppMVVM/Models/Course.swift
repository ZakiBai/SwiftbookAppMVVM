//
//  Course.swift
//  SwiftbookAppMVVM
//
//  Created by Zaki on 24.07.2023.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
