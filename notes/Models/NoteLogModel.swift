//
//  NoteLogModel.swift
//  notes
//
//  Created by Dason Tiovino on 11/07/24.
//

import Foundation
import SwiftData

@Model
class NoteLog: Identifiable{
    var id: UUID
    var content: String
    var createdAt: Date

    init(id: UUID = UUID(), content:String =  "Type your activity here", createdAt:Date = Date.now) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}
