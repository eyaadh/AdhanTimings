//
//  DuaModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class ThasBees: Identifiable, Decodable {
    var id:UUID?
    var name:String = ""
    var duas:[Dua] = [Dua]()
}

class Dua: Identifiable, Decodable{
    var id:UUID?
    var title:String = ""
    var arabic:String = ""
    var translation:String?
    var reference:String?
}
