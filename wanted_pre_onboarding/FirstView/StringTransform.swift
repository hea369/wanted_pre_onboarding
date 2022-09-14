//
//  StringTransform.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/14.
//

import Foundation

//"gongju","Gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jejusi", "cheonan", "cheongju", "chuncheon"

extension String {
    func returnString() -> String {
        if self == "Gongju" {
           return "공주"
        } else if self == "Gwangju" {
            return "광주"
        } else if self == "Gumi" {
            return "구미"
        } else if self == "Gunsan" {
            return "군산"
        } else if self == "Daegu" {
            return "대구"
        } else if self == "Daejeon" {
            return "대전"
        } else if self == "Mokpo" {
            return "목포"
        } else if self == "Busan" {
            return "부산"
        } else if self == "Seosan" {
            return "서산"
        } else if self == "Seoul" {
            return "서울"
        } else if self == "Sokcho" {
            return "속초"
        } else if self == "Suwon" {
            return "수원"
        } else if self == "Suncheon" {
            return "순천"
        } else if self == "Ulsan" {
            return "울산"
        } else if self == "Iksan" {
            return "익산"
        } else if self == "Jeonju" {
            return "전주"
        } else if self == "Jejusi" {
            return  "제주"
        } else if self == "Cheonan" {
            return "천안"
        } else if self == "Cheongju" {
            return "청주"
        } else {
            return "춘천"
        }
    }
}
