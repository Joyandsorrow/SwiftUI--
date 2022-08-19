import SwiftUI

struct theFileView: View {
    
    let file : FileModel
    
    var body: some View {
        
            HStack{
                VStack(alignment: .leading){
                    Text(file.title)
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.top)
                    Text(file.note)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                        .padding(.horizontal)
                        .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 6)
                    HStack{
                        Text(file.Creationtime, style: .date)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                        Spacer()
                        Text(file.Creationtime, style: .time)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                    }.padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 350, style: .continuous)
                                .fill(.white)
                        )
                        .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 6)
                }
                
            }
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [
                        .blue,
                        .blue.opacity(0.8)
                    ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            )
            .shadow(color: .gray.opacity(0.1), radius: 10, x: 0, y: 2)
        
    }
}
