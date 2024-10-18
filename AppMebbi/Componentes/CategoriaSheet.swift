import Foundation
import SwiftUI

struct CategoriaSheet: View {
    @ObservedObject var categoriaStore: CategoriaStore
    @State private var novaCategoria: String = ""
    @State private var novaCor: Color = .black
    
    var body: some View {
        VStack{
            Text("Criar Categoria")
                .foregroundColor(Color.azulPrincipal)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 25)
            HStack{
                Text("Nome")
                    .foregroundColor(Color.azulPrincipal)
                    .font(.title3)
                    .padding(.trailing, 5)
                TextField("Nome da Matéria", text: $novaCategoria)
                    .foregroundColor(Color.cinza)
            }
            HStack{
                Text("Cor")
                    .foregroundColor(Color.azulPrincipal)
                    .font(.title3)
                    .padding(.trailing, 10)
                ColorPicker("", selection: $novaCor, supportsOpacity: false)
            }
            Button("Salvar"){
                if !novaCategoria.isEmpty{
                    categoriaStore.categorias[novaCategoria] = novaCor
                    novaCategoria = ""
                    novaCor = .black
                }
            }
            .foregroundColor(Color.azulPrincipal)
            .font(.title3)
            .padding(.top, 5)
            Spacer()
        }.padding(.horizontal, 30)
    }
}


struct CategoriaSheet_Previews: PreviewProvider {
    static var previews: some View {
        CategoriaSheet(categoriaStore: CategoriaStore())
    }
}
