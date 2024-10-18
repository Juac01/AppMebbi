import Foundation
import SwiftUI

struct AnotacaoView: View {
    var body: some View {
        NavigationStack{
            Text("Testando")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                            HStack{
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color.azulPrincipal.opacity(0.5))
                                Text("Voltar")
                                    .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                                    .font(.title3)
                            }
                            
                        }
                    }
                    ToolbarItem(placement: .principal){
                        Text("Anotação")
                            .foregroundColor(.azulPrincipal)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(destination:     NovaAnotacaoView()
                            .navigationBarBackButtonHidden(true)){
                                Text("Editar")
                                    .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                                    .font(.title3)
                                    .padding(.trailing)
                            }
                    }
                    
                }
        }
    }
}

//titulo
//anotacoes


#Preview {
    AnotacaoView()
}
