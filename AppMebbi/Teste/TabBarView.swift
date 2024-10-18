import SwiftUI

// Tela 1: Anotações
struct AnotacoesView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                Text("Anotações")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Anotações")
        }
    }
}

// Tela 2: Flashcards
struct FlashcardsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                Text("Flashcards")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Flashcards")
        }
    }
}

// Tela 3: Categorias
struct CategoriasView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brown
                Text("Categorias")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Categorias")

        }
    }
}

// Tab Bar
struct ConteudoViews: View {
    
    
    var body: some View {
        
        TabView {
            
            ContentView()
                .tabItem {
                    Image(systemName: "magazine")
                    Text("Anotações")
                }
            
            FlashcardsView()
                .tabItem {
                    Image(systemName: "greetingcard")
                    Text("Flashcards")
                }
            
            CategoriasView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Categorias")
                }
        }
        .accentColor(Color.azulPrincipal)
        
    }
}

// Preview
struct ConteudoViews_Previews: PreviewProvider {
    static var previews: some View {
        ConteudoViews()
    }
}
