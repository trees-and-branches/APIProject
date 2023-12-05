//
//  testItems.swift
//  APIProject
//
//  Created by shark boy on 12/5/23.
//

import Foundation

struct TestItem {
    let item: String
}
struct TestItems {
    var items: [TestItem] = []
    
    static func makeThisMany(_ howMany: Int) -> TestItems {
        TestItems(items: (0..<howMany).map { TestItem(item: String($0)) })
    }
}
