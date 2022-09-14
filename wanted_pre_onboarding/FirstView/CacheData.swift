//
//  CashData.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/14.
//

import Foundation

class IconIamgeDown {
    static var shared: IconIamgeDown = IconIamgeDown()
    var cache : [URL: Data]?
    
    func down(url: URL) -> Data {
        if let cache = cache?[url] {
            return cache
        }
        let data = try! Data(contentsOf: url)
        cache?[url] = data
        return data
    }
}
