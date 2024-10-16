import SwiftUI
import PencilKit

struct Anotacoes: View {
    
    @State private var canvasView = PKCanvasView()
    @State private var ferramentaPicker = PKToolPicker()
    
    
    @State private var titulo: String = ""
    @State private var anotacoes: String = "As reações químicas são processos que envolvem a transformação de substâncias em novos compostos..."
    @State private var categoria: String = ""
    @State private var imagemAnexo: UIImage? = nil // Para imagem anexada
    @State private var foto: UIImage? = nil // Para foto da câmera
    @State private var desenhando: Bool = false // Controla o estado de desenho
    @State private var editandoDesenho: Bool = false // Controla se está editando ou não o desenho
    @State private var mostrandoActionSheet: Bool = false // Controla a exibição do ActionSheet
    @State private var mostrandoOpcoesCamera: Bool = false
    
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
                
                // Corpo de texto
                TextEditor(text: $anotacoes)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    .frame(minHeight: 200, maxHeight: 300)
                    .border(Color.gray, width: 0.2)
                    .cornerRadius(8)
                    .font(.body)
                    .foregroundColor(Color.black)
                
                // Exibe o desenho quando não está editando
                if desenhando {
                    if editandoDesenho {
                        // Se estiver no modo de edição de desenho
                        CanvasView(canvasView: $canvasView)
                            .onAppear {
                                if let window = UIApplication.shared.windows.first {
                                    ferramentaPicker.setVisible(true, forFirstResponder: canvasView)
                                    ferramentaPicker.addObserver(canvasView)
                                    canvasView.becomeFirstResponder()
                                }
                            }
                            .background(Color.clear)
                            .cornerRadius(8)
                            .frame(height: 300) // Tamanho da área de desenho
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                    } else {
                        // Se estiver apenas visualizando o desenho
                        Image(uiImage: canvasView.drawing.image(from: canvasView.bounds, scale: 1.0))
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(10)
                            .padding(.top, 10)
                    }
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
                    if editandoDesenho {
                        // Se estiver no modo de edição de desenho, mostrar "OK"
                        Button(action: {
                            editandoDesenho = false // Alterna para visualização
                        }) {
                            Text("OK")
                                .foregroundColor(Color("Color"))
                        }
                    } else {
                        // Se não estiver editando o desenho, mostrar "Salvar"
                        Button(action: {
                            // Ação para salvar as anotações e o desenho
                        }) {
                            Text("Salvar")
                                .foregroundColor(Color("Color"))
                        }
                    }
                }
                
                // Itens da barra inferior
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Button(action: {
                            mostrandoActionSheet = true // Mostra o ActionSheet
                        }) {
                            VStack {
                                Image(systemName: "paperclip")
                                    .foregroundColor(Color("Color"))
                                Text("Anexar")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                            .actionSheet(isPresented: $mostrandoActionSheet) {
                                ActionSheet(title: Text("Anexar"), message: Text("Escolha uma opção"), buttons: [
                                    .default(Text("Escolher Foto")) {
                                        // Ação para escolher foto
                                    },
                                    .default(Text("Anexar Arquivo")) {
                                        // Ação para anexar arquivo
                                    },
                                    .cancel() // Botão de cancelamento
                                ])
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                            if desenhando {
                                editandoDesenho.toggle() // Alterna entre editar e visualizar desenho
                            } else {
                                desenhando = true // Habilita o desenho pela primeira vez
                                editandoDesenho = true
                            }
                        }) {
                            VStack {
                                Image(systemName: "pencil.tip.crop.circle")
                                    .foregroundColor(Color("Color"))
                                Text(editandoDesenho ? "OK" : "Desenhar")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                        }
                        Spacer()
                        Button(action: {
                            mostrandoOpcoesCamera = true // Mostra o ActionSheet para escolher entre câmera e galeria
                        }) {
                            VStack {
                                Image(systemName: "camera")
                                    .foregroundColor(Color("Color"))
                                Text("Câmera")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 12))
                            }
                            .actionSheet(isPresented: $mostrandoOpcoesCamera) {
                                ActionSheet(title: Text("Câmera"), message: Text("Escolha uma opção"), buttons: [
                                    .default(Text("Tirar Foto")) {
                                        //sourceType = .camera
                                       // mostrandoCameraOptions = true
                                    },
                                    .default(Text("Escolher da Galeria")) {
                                       // sourceType = .photoLibrary
                                      //  mostrandoCameraOptions = true
                                    },
                                    .cancel() // Botão de cancelamento
                                ])
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


// Preview
#Preview {
    Anotacoes()
}
