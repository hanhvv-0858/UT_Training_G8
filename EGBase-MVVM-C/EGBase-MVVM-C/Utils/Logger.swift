//
//  File.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation

func logD(_ message: String? = nil, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let className = (file as NSString).lastPathComponent
    print("\n ❤️ \(message ?? "") - \(function) at line \(line) - \(className)")
    #endif
}
