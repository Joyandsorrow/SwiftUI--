import SwiftUI

struct AbbView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var FileViewModel: FileViewModel
    @State var titleFieldtitle: String = ""
    @State var noteFieldtitle: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ZStack{
        ScrollView (.vertical, showsIndicators: false){
            VStack{
                TextField("File Title", text: $titleFieldtitle)
                    .font(.system(size: 40, weight: .black))
                TextField("File Note (Can be omitted)", text: $noteFieldtitle)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.bottom)
                HStack{
                    Text("Code note")
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 7)
                    Spacer()
                    //Image(systemName: "circle")
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .semibold))
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 7)
                    
                }
                .padding(.bottom)
                
                HStack{
                    Text("Allow Preview")
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 7)
                    Spacer()
                    //Image(systemName: "circle")
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .semibold))
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 7)
                    
                }
                .padding(.bottom)
                
                HStack{
                    Text("Simple interface")
                        .bold()
                        .foregroundColor(.gray)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 7)
                    Spacer()
                    Image(systemName: "circle")
                    //Image(systemName: "checkmark.circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .semibold))
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 7)
                    
                }.padding(.bottom)
            }.padding()
        }
            VStack{
                Spacer()
            Button{
                saveButtonPressed()
            }label: {
                HStack{
                    Spacer()
                    Text("Create And Open")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .heavy))
//                    +
//                    Text("a new file")
//                        .foregroundColor(.white)
//                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }.padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                    )
                    .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 6)
                    .padding()
            }.alert(isPresented: $showAlert, content: getAlert)
            }
        }//z
    }//var body
    
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            FileViewModel.addfile(title: titleFieldtitle, note: noteFieldtitle)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if titleFieldtitle.count < 1 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

    
}


