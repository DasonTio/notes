//
//  TextModel.swift
//  notes
//
//  Created by Dason Tiovino on 10/07/24.
//

import Foundation
import SwiftData

enum TextType: String, Codable {
    case headline
    case subheadline
    case bold
    case normal
}

@Model
class TextContent:NoteContent{
    var type: [TextType]?
    
    init(id: UUID, content: String, type: [TextType]?) {
        super.init(id: id, content: content)
        
        self.type = type
    }
}
