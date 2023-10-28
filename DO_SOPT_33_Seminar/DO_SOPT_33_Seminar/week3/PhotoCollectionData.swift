//
//  PhotoCollectionData.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/28/23.
//

import Foundation

struct PhotoCollectionData {
    let image: String
    var isLiked: Bool
    
    init(image: String, isLiked: Bool) {
        self.image = image
        self.isLiked = isLiked
    }
}

var imageCollectionList: [PhotoCollectionData] = [.init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: false),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: true),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: true),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: false),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: true),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: true)]
