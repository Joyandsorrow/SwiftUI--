import SwiftUI
import Foundation

class FileViewModel: ObservableObject {
    @Published var file : [FileModel] = [] {
        didSet{
            savefiles()
        }
    }
    let FileKey: String = "File_key"
    
    func deletefile(indexSet: IndexSet) {
        file.remove(atOffsets: indexSet)
    }
    
    func movefile(from: IndexSet, to: Int) {
        file.move(fromOffsets: from, toOffset: to)
    }
    
    func addfile(title: String, note: String) {//添加file
        let newfile = FileModel(title: title, note: note, isCompleted: false, Creationtime: Date())
        file.append(newfile)
    }
    
    init() {//保存声明
        getfile()
    }
    
    func getfile() {//保存中转
        guard
            let data = UserDefaults.standard.data(forKey: FileKey),
            let savefiles = try? JSONDecoder().decode([FileModel].self, from: data)
        else { return }
        
        self.file = savefiles
    }
    
    func savefiles() {//保存方法
        if let encodedData = try? JSONEncoder().encode(file) {
            UserDefaults.standard.set(encodedData, forKey: FileKey)
        }
    }
    
    func updateItem(item: FileModel) {
        if let index = file.firstIndex(where: { $0.id == item.id }) {
            file[index] = item.updateCompletion()
        }
    }
}
