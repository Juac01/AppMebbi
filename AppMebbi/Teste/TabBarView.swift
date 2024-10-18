//
//  TabBarView.swift
//  AppMebbi
//
//  Created by JOSE JOAQUIN JULCAMORO BUSTAMANTE on 18/10/24.
//

import SwiftUI

import SwiftUI

enum Tab {
    case anotacoes
    case flashcards
    case categorias
}

struct TabBarView: View {
    @State private var selectedTab: Tab = .anotacoes

    var body: some View {
        TabView(selection: $selectedTab) {
            AnotacoesView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "magazine")
                    Text("Anotações")
                }
                .tag(Tab.anotacoes)

            FlashcardsView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "greetingcard")
                    Text("Flashcards")
                }
                .tag(Tab.flashcards)

            CategoriasView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Categorias")
                }
                .tag(Tab.categorias)
        }
        .accentColor(Color.blue) // Ou sua cor personalizada
    }
}

struct AnotacoesView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationStack {
            VStack {
                Text("Anotações")
                Button("Ir para Flashcards") {
                    selectedTab = .flashcards
                }
            }
            .navigationTitle("Anotações")
        }
    }
}

struct FlashcardsView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationStack {
            VStack {
                Text("Flashcards")
                Button("Ir para Categorias") {
                    selectedTab = .categorias
                }
            }
            .navigationTitle("Flashcards")
        }
    }
}

struct CategoriasView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationStack {
            VStack {
                Text("Categorias")
                Button("Ir para Anotações") {
                    selectedTab = .anotacoes
                }
            }
            .navigationTitle("Categorias")
        }
    }
}

#Preview {
    TabBarView()
}
