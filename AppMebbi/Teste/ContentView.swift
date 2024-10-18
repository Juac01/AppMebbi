import SwiftUI

struct ContentView: View {
    @State private var materias = ["Quimica I", "Quimica II", "Quimica III", "Quimica IV"]
    @State private var dataAnotacao = Date.now
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: NovaAnotacaoView().navigationBarBackButtonHidden(true)){
                HStack{
                    Text("Nova Anotação")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "plus.circle.fill")
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                .foregroundColor(.white)
                .background(Color.azulPrincipal)
                .cornerRadius(35)
            }.padding()
            
            Divider()
                .background(Color.azulPrincipal)
            HStack{
                Text("Data Selecionada:")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.azulPrincipal)
                DatePicker(selection: $dataAnotacao, in: ...Date.now, displayedComponents: .date){
                    
                }
                .labelsHidden()
                .tint(Color.azulPrincipal)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            List{
                ForEach($materias, id: \.self){ $materia in
                    ZStack{
                        NavigationLink(destination: AnotacaoView().navigationBarBackButtonHidden(true)){ EmptyView() }.opacity(0.0)
                        HStack(){
                            Text(materia)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Rectangle()
                                .fill(.yellow)
                                .frame(width: 45)
                        }
                        .frame(height:70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                     
                }
                .listRowSeparator(.hidden)
                .background(Color.azulPrincipal)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 6, trailing: 20))
            }
            .listStyle(PlainListStyle())

        }
         
    }
}

#Preview {
    ContentView()
}
