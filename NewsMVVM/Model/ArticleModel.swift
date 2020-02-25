//
//  ArticleModel.swift
//  NewsMVVM
//
//  Created by Nisha Poddar on 25/02/20.
//  Copyright © 2020 Nisha Poddar. All rights reserved.
//

import Foundation
import UIKit

struct ArticleList: Codable {
    var status: String
    var totalResults: Int
    var articles: [Articles]?
}

struct Articles: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}


struct Course: Codable {
    var id: Int
    var name: String
    var link: String
    var imageUrl: String
    var number_of_lessons: Int
}

struct CourseViewModel {
    var courseVM: Course
    
    init(_ course: Course){
        self.courseVM = course
    }
    
    var id: Int {
        return courseVM.id
    }
    
    var name: String {
        return courseVM.name
    }
    
    var link: String {
        return courseVM.link
    }
    
    var imageUrl: String {
        return courseVM.imageUrl
    }
    
    var number_of_lessons: Int {
        return courseVM.number_of_lessons
    }
}

//{"id":1,"name":"Instagram Firebase","link":"https://www.letsbuildthatapp.com/course/instagram-firebase","imageUrl":"https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/04782e30-d72a-4917-9d7a-c862226e0a93","number_of_lessons":49}
