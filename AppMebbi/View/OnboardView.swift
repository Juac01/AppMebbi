import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            
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
                    currentTab = 1
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
            // Para preencher a tela toda
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
                    currentTab = 2
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
            .ignoresSafeArea() // Para preencher a tela toda
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
                    currentTab = 3
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
            .ignoresSafeArea() // Para preencher a tela toda
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
          // Para preencher a tela toda
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}



// Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView() 
    }
}
