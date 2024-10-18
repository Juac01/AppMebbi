import SwiftUI

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
                
                Text("Esta é a primeira tela do onboarding.")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    abaAtual = 1
                }) {
                    Text("Próximo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.azulPrincipal) // Cor #5561F4
            .tag(0)
            
            // Tela 2
            VStack {
                Spacer()
                Text("Explore!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Esta é a segunda tela do onboarding.")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    abaAtual = 2
                }) {
                    Text("Próximo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.amareloPrincipal) // Cor #F1A920
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
                
                Text("Esta é a terceira tela do onboarding.")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    abaAtual = 3
                }) {
                    Text("Próximo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.azulPrincipal) // Cor #5561F4
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
                
                Text("Esta é a última tela do onboarding.")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Ação para finalizar o onboarding
                }) {
                    Text("Concluir")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.amareloPrincipal) // Cor #F1A920
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        
    }
}

// Preview
struct TelaDeIntroducao_Previews: PreviewProvider {
    static var previews: some View {
        TelaDeIntroducao()
    }
}
