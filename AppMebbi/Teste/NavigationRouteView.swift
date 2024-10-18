import SwiftUI
import Observation

enum AppTela: Hashable, Identifiable, CaseIterable {
    
    case anotacoes
    case flashcards
    case categorias
    
    var id: AppTela { self }
}

extension AppTela {
    
    @ViewBuilder
    var label: some View {
        switch self {
            case .anotacoes:
                Label("Anotações", systemImage: "magazine")
            case .flashcards:
                Label("Flashcards", systemImage: "greetingcard")
            case .categorias:
                Label("Categorias", systemImage: "books.vertical")
        }
    }
     
    @ViewBuilder
    var destino: some View {
        switch self {
            case .anotacoes:
                ContentView()
            case .flashcards:
                FlashcardsNavigationStack()
            case .categorias:
                CategoriasNavigationStack()
        }
    }
}

@Observable
class Roteador {
    var rotasFlashcards: [RotaFlashcard] = []
    var rotasCategorias: [RotaCategoria] = []
}

enum RotaCategoria {
    case inicio
    case detalhe
}

struct Flashcard: Hashable {
    let nome: String
}

enum RotaFlashcard: Hashable {
    case inicio
    case detalhe(Flashcard)
}

struct FlashcardsNavigationStack: View {
    
    @Environment(Roteador.self) private var roteador
    
    var body: some View {
        
        @Bindable var roteador = roteador
        
        NavigationStack(path: $roteador.rotasFlashcards) {
            Button("Ir para detalhe do Flashcard") {
                roteador.rotasFlashcards.append(.detalhe(Flashcard(nome: "Flashcard Exemplo")))
            }.navigationDestination(for: RotaFlashcard.self) { rota in
                switch rota {
                    case .inicio:
                        Text("Página Inicial")
                    case .detalhe(let flashcard): 
                    VStack {
                        Text("Detalhe: \(flashcard.nome)")
                        Text("Esconder a tabBar")
                            .font(.caption)
                    }.toolbar(.hidden, for: .tabBar) // Para esconder a tabbar
                }
            }
        }
    }
}
 
struct CategoriasNavigationStack: View {
    
    @Environment(Roteador.self) private var roteador
    
    var body: some View {
        
        @Bindable var roteador = roteador
        
        NavigationStack(path: $roteador.rotasCategorias) {
            Button("Ir para detalhe de Categoria") {
                roteador.rotasCategorias.append(.detalhe)
            }.navigationDestination(for: RotaCategoria.self) { rota in
                switch rota {
                    case .inicio:
                        Text("Página Inicial")
                    case .detalhe:
                        Text("Detalhe da Categoria")
                    
                }
            }
        }
    }
}

//struct AnotacoesNavigationStack: View {
//    var body: some View {
//        NavigationStack {
//            List(1...10, id: \.self) { index in
//                NavigationLink {
//                    Text("Detalhe da Anotação \(index)")
//                } label: {
//                    Text("Anotação \(index)")
//                }
//            }.navigationTitle("Anotações")
//        }
//    }
//}


struct AppTabView: View {
    
    @Binding var selecao: AppTela?
    
    var body: some View {
        TabView(selection: $selecao) {
            ForEach(AppTela.allCases) { tela in
                tela.destino
                    .tag(tela as AppTela?)
                    .tabItem { tela.label }
            }
        }
    }
}

struct ConteudoView: View {
    
    @State private var selecao: AppTela? = .anotacoes
    
    var body: some View {
        AppTabView(selecao: $selecao)
    }
}

#Preview {
    ConteudoView()
        .environment(Roteador())
}
