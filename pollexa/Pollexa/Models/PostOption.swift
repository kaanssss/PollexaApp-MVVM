//
//  PostOption.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

extension Post {
    
    struct Option: Decodable {
        
        // MARK: - Types
        enum CodingKeys: String, CodingKey {
            case id
            case imageName
        }
        
        // MARK: - Properties
        let id: String
        let image: UIImage
        
        // MARK: - Life Cycle
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(String.self, forKey: .id)
            
            let imageName = try container.decode(
                String.self,
                forKey: .imageName
            )
            
            if let image = UIImage(named: imageName) {
                self.image = image
            } else {
                throw DecodingError.dataCorrupted(.init(
                    codingPath: [CodingKeys.imageName],
                    debugDescription: "An image with name \(imageName) could not be loaded from the bundle.")
                )
            }
        }
    }
}
