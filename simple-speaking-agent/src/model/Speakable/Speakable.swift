//
//  Speakable.swift
//  simple-speaking-agent
//
//  Created by うえでー on 2016/05/04.
//  Copyright © 2016年 Daiki UEDA. All rights reserved.
//

import Foundation

protocol Speakable {
    func prepare(string: String?) throws
    func speak()
}