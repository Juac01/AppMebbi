import Foundation
import SwiftUI

class CategoriaStore: ObservableObject{
    @Published var categorias: [String: Color] = [
        "Matemática": .yellow,
        "Quimica": .blue,
        "Astronomia": .green
    ]}

struct CategoriaView: View {
    @State private var mostrarSheet = false
    @StateObject private var categoriaStore = CategoriaStore()
    
    var body: some View {
        VStack{
            HStack{
                Text("Categorias")
                    .foregroundColor(.azulPrincipal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action:{
                    mostrarSheet = true
                }){
                    Image(systemName: "plus")
                        .foregroundColor(Color.azulPrincipal)
                        .font(.title)
                }.sheet(isPresented: $mostrarSheet){
                    CategoriaSheet(categoriaStore: categoriaStore)
                       //.presentationDetents([.medium])
                       .presentationDetents([.fraction(0.8), .height(200), .large])
                }
            }.padding(.horizontal, 20)
                .padding(.top, 50)
            List{
                ForEach(categoriaStore.categorias.sorted(by: { $0.key < $1.key }), id: \.key) { categoria, cor in
                    ZStack{
                        NavigationLink(destination: AnotacaoView().navigationBarBackButtonHidden(true)){ EmptyView() }.opacity(0.0)
                        HStack(){
                            Circle()
                                .fill(cor)
                                .frame(width: 35)
                            Text(categoria)
                                .font(.title2)
                                .foregroundColor(Color.azulPrincipal)
                                .padding(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(Color.azulPrincipal)
                        }
                        .frame(height:70)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                        Button("Deletar"){}
                            .tint(.red)
                        Button("Editar"){}
                            .tint(.gray)
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 6, trailing: 20))
            }
            .listStyle(PlainListStyle())
            Spacer()
        }
        
    }
}

#Preview(){
    CategoriaView()
}
