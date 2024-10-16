import SwiftUI
import PencilKit

struct Anotacoes: View {
    @State private var titulo: String = ""
    @State private var anotacoes: String = "As reações químicas são processos que envolvem a transformação de substâncias em novos compostos..."
    @State private var categoria: String = ""
    
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    
    @State private var imagemAnexo: UIImage? = nil // Para imagem anexada
    @State private var foto: UIImage? = nil // Para foto da câmera
    @State private var isDrawing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                 
                // Título com estilo diferenciado
                TextField("Insira o título", text: $titulo)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                
                // Stack para sobrepor o TextEditor e a área de desenho
                ZStack {
                    // Corpo de texto
                    TextEditor(text: $anotacoes)
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                        .frame(height: 550)
                        .border(Color.gray, width: 0.2)
                        .cornerRadius(8)
                        .font(.body)
                        .foregroundColor(Color.black)
                    
                    // Area de desenho que aparece por cima
                    if isDrawing {
                        CanvasView(canvasView: $canvasView)
                            .onAppear(){
                                if let window = UIApplication.shared.windows.first {
                                    toolPicker.setVisible(true, forFirstResponder: canvasView)
                                    toolPicker.addObserver(canvasView)
                                    canvasView.becomeFirstResponder()
                                }
                            }
                            .background(Color.clear)
                            .cornerRadius(8)
                            .frame(height: 550) // Mantém o tamanho
                    }
                }
                
                
                // Imagem anexada
                if let imagem = imagemAnexo {
                    Image(uiImage: imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.top, 10)
                }
                
                // Foto tirada com a câmera
                if let foto = foto {
                    Image(uiImage: foto)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.top, 10)
                }
                
                Spacer()
                
            }
            .toolbar {
                // Botão de voltar
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Ação para voltar
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Color"))
                            Text("Voltar")
                                .foregroundColor(Color("Color"))
                        }
                    }
                }
                
                // Botão de salvar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Ação para salvar
                    }) {
                        Text("Salvar")
                            .foregroundColor(Color("Color"))
                    }
                }
                
                // Itens da barra inferior
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        NavigationLink(destination: TelaAnexoView()) {
                            VStack {
                                Image(systemName: "paperclip")
                                    .foregroundColor(Color("Color"))
                                Text("Anexar")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                        }
                        Spacer()
                        Button(action: {
                            isDrawing.toggle() // Alterna entre o modo de desenho e texto
                        }) {
                            VStack {
                                Image(systemName: "pencil.tip.crop.circle")
                                    .foregroundColor(Color("Color"))
                                Text(isDrawing ? "Escrever" : "Desenhar")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                        }
                        Spacer()
                        NavigationLink(destination: TelaCameraView()) {
                            VStack {
                                Image(systemName: "camera")
                                    .foregroundColor(Color("Color"))
                                Text("Câmera")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                }
            }
            .navigationTitle("Anotação")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Exemplo de telas de destino
struct TelaAnexoView: View {
    var body: some View {
        Text("Tela de Anexo")
    }
}

struct TelaCameraView: View {
    var body: some View {
        Text("Tela da Câmera")
    }
}

// CanvasView para o PencilKit
struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //
    }
}

// Preview
#Preview {
    Anotacoes()
}
