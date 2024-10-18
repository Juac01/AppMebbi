import Foundation
import  SwiftUI

struct DetalhesView: View {
    @State private var dataAnotacao = Date.now
    @State private var selecionadaRepeticao: String = "1-7-30"
    @State private var mostrarSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Data da Anotação")
                        .foregroundColor(Color.cinza)
                    Spacer()
                    DatePicker(selection: $dataAnotacao, in: ...Date.now, displayedComponents: .date){
                        
                    }
                    .labelsHidden()
                    .tint(Color.azulPrincipal)
                }
                Divider()
                    .background(Color.azulPrincipal)
                HStack{
                    Text("Categoria:")
                        .foregroundColor(Color.cinza)
                    Spacer()
                    NavigationLink(destination: Text("materia")){
                        Text("Materia")
                            .foregroundColor(Color.azulPrincipal.opacity(0.5))
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color.azulPrincipal.opacity(0.5))
                    }
                }
                Divider()
                    .background(Color.azulPrincipal)
                HStack{
                    Button(action:{
                        mostrarSheet = true
                    }){
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color.azulPrincipal)
                    }.sheet(isPresented: $mostrarSheet){
                        RepeticaoSheet()
                            .presentationDetents([.medium])
                    }
                    Text("Repetição Espaçada")
                        .foregroundColor(Color.cinza)
                    Spacer()
                    Menu(selecionadaRepeticao){
                        Button("1-7-30", action: {selecionadaRepeticao = "1-7-30" })
                        Button("1-3-7-14",  action: {selecionadaRepeticao = "1-3-7-14" })
                        Button("2-4-8-16-32", action: {selecionadaRepeticao = "2-4-8-16-32" })
                        Button("Nenhuma", action: {selecionadaRepeticao = "Nenhuma" })
                    }.foregroundColor(Color.azulPrincipal)
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundColor(Color.azulPrincipal)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination:NovaAnotacaoView()
                        .navigationBarBackButtonHidden(true)){
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
                    NavigationLink(destination:  DetalhesView().navigationBarBackButtonHidden(true)){
                        HStack{
                            Text("Salvar")
                                .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                                .font(.title3)
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                            
                            /*
                             Button(action: {showingSheet.toogle()}.sheet(isPresented: $showingSheet){RepeticaoSheet()}){
                             Image(systemName: "chevron.forward")
                             .foregroundStyle(Color.azulPrincipal)
                             }*/
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    DetalhesView()
}
