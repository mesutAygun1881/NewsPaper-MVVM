//
//  NewsApiModel.swift
//  NewsPaperApi
//
//  Created by Mesut Aygün on 14.05.2021.
//

import Foundation

struct  ArticlesInfo : Codable {
    var articles : [Articles]
}

struct Articles : Codable {
    var source : Source
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
}

struct Source : Codable {
    var name : String?
}
