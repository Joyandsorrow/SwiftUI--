import SwiftUI

struct HomeView: View {
    
    let columnCount: Int = 4
    let gridSpacing: CGFloat = 16.0
    @Environment(\.horizontalSizeClass) var horizontalClass
    @State var showabbview = false
    @EnvironmentObject var fileViewModel : FileViewModel
    var body: some View {
        ZStack{
            VStack{
                Color.clear
                    .frame(height: 70)
        
            VStack{
                if horizontalClass == .regular{
                    if fileViewModel.file.isEmpty{
                        Text("No project yet")
                    } else {
                        VStack{
                        ScrollView (.vertical, showsIndicators: false){
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: columnCount), spacing: gridSpacing) {
                        ForEach(fileViewModel.file) { file in
                            theFileView(file: file)
                                
                        }
                    
                    }.padding()
                    }//if
                    }//sro
                    }
                }else{
                    if fileViewModel.file.isEmpty{
                        Text("No project yet")
                    } else {
                        ScrollView (.vertical, showsIndicators: false){
                        VStack{
                            ForEach(fileViewModel.file) { file in
                                theFileView(file: file)
                                
                            }
                        }.padding(.top)
                        }//scr
                    }//if
                }
            }.padding()
        
            }//v
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Text("Application Studio")
                            .foregroundColor(.blue)
                            .font(.system(size: 28, weight: .black))
                            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 6)
                            .padding(.bottom,2)
                        Text("Face the facts and be brave of difficulties and dangers")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .medium))
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 6)
                    }
                    Spacer()
                }.padding()
                    .background()
                    .shadow(color: .gray.opacity(0.15), radius: 10, x: 0, y: 5)
                    .ignoresSafeArea()
                Spacer()
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                Button{
                    showabbview.toggle()
                }label: {
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .black))
                            .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 6)
                            .padding(.bottom,2)
                    }.padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25,style: .continuous)
                        )
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 6)
                        .padding()
                }.sheet(isPresented: $showabbview, content: {
                    AbbView()
                })
                }//H
            }//v
        }
    }
}

