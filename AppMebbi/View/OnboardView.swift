import SwiftUI
import UserNotifications

struct TelaDeIntroducao: View {
    @State private var abaAtual = 0
    
    var body: some View {
        TabView(selection: $abaAtual) {
            
            // Tela 1
            VStack {
                Spacer()
                Text("Bem-vindo!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Use mebbi para turbinar e organizar seus estudos.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Image("Onboard01")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.amareloPrincipal) // Cor #5561F4
            .tag(0)
            
            // Tela 2
            VStack {
                Spacer()
                Text("Explore!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Todas suas anotações e resumos em um só lugar.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                Image("Onboard02")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.azulPrincipal) // Cor #F1A920
            .ignoresSafeArea()
            .tag(1)
            
            // Tela 3
            VStack {
                Spacer()
                Text("Fácil de usar!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Fixe os conteúdos com a técnica de repetição espaçada.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                Image("Onboard03")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.amareloPrincipal) // Cor #5561F4
            .ignoresSafeArea()
            .tag(2)
            
            // Tela 4
            VStack {
                Spacer()
                Text("Vamos começar!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Ao clicar em “Permitir”, notificaremos quando você precisar revisar seu conteúdo!.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                Image("Onboard04")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.azulPrincipal) // Cor #F1A920
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        .onChange(of: abaAtual) { newValue in
            if newValue == 3 { // Corrigido para a última aba
                solicitarAutorizacao()
            }
        }
    }
    
    func solicitarAutorizacao() {
        let opcoes: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: opcoes) { (sucesso, erro) in
            if let erro = erro {
                print("ERRO: \(erro)")
            } else {
                print("SUCESSO")
                
            }
        }
    }
}

// Preview
struct TelaDeIntroducao_Previews: PreviewProvider {
    static var previews: some View {
        TelaDeIntroducao()
    }
}
