//
//  IslandDataModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class Island: Identifiable, Decodable {
    var id:UUID?
    var reg_no:String = ""
    var name_dv:String = ""
    var name_en:String = ""
    var atoll_code:String = ""
}
