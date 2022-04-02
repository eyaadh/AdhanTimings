//
//  AtollsDataModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class Atoll: Identifiable, Decodable {
    var id:UUID?
    var code_letter:String = ""
    var name_abbr_en:String = ""
    var name_abbr_dv:String = ""
    var name_official_dv:String = ""
    var name_official_en:String = ""
}
