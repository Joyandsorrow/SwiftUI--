import SwiftUI
import Foundation

// Immutable Struct has only 'let' constants
struct FileModel: Identifiable, Codable {
    
    let id: String
    let title: String
    let note: String
    let isCompleted: Bool
    let Creationtime: Date
    
    init(id: String = UUID().uuidString, title: String, note: String, isCompleted: Bool, Creationtime: Date) {
        self.id = id
        self.title = title
        self.note = note
        self.isCompleted = isCompleted
        self.Creationtime = Creationtime
    }
    
    func updateCompletion() -> FileModel {
        return FileModel(id: id, title: title, note: note, isCompleted: !isCompleted, Creationtime: Creationtime)
    }
    
}
