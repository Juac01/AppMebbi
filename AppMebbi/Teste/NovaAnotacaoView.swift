import Foundation
import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}


struct NovaAnotacaoView: View {
    @State private var canvasView = PKCanvasView()
    @State private var ferramentaPicker = PKToolPicker()
    
    @State private var titulo: String = ""
    private var maxCharacters = 30
    @State private var anotacoes: String = "As reações químicas são processos que envolvem a transformação de substâncias em novos compostos..."
    @State private var imagemAnexo: UIImage? = nil
    @State private var foto: UIImage? = nil
    @State private var desenhando: Bool = false
    @State private var editandoDesenho: Bool = false
    @State private var mostrandoActionSheet: Bool = false
    @State private var mostrandoOpcoesCamera: Bool = false
    // Controle do modo de apresentação
      @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Insira o título", text: $titulo)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(titulo.count > maxCharacters ? Color.red : Color("azulPrincipal"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    .onChange(of: titulo) { newValue in
                        // Limitar os caracteres se passar do máximo
                        if newValue.count > maxCharacters {
                            titulo = String(newValue.prefix(maxCharacters))
                        }
                    }
                
                // Aviso de limite excedido
                if titulo.count == maxCharacters {
                    Text("O título atingiu o limite de \(maxCharacters) caracteres.")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal, 30)
                }
                
                
                TextEditor(text: $anotacoes)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    .frame(minHeight: 200, maxHeight: 300)
                    .border(Color.gray, width: 0.2)
                    .cornerRadius(8)
                    .font(.body)
                    .foregroundColor(Color.black)
                
                if desenhando {
                    if editandoDesenho {
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
                            .frame(height: 300)
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                    } else {
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
        
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
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
                        .foregroundColor(Color.azulPrincipal)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if editandoDesenho {
                        Button(action: {
                            editandoDesenho = false
                        }) {
                            Text("OK")
                                .foregroundColor(Color.azulPrincipal)
                                .padding(.trailing, 5)
                                .font(.title3)
                        }
                    } else {
                        NavigationLink(destination: DetalhesView().navigationBarBackButtonHidden(true)){
                            HStack{
                                Text("Salvar")
                                    .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                                    .font(.title3)
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.azulPrincipal.opacity(0.5))
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .bottomBar ) {
                    HStack {
                        Spacer()
                        Button(action: {
                            mostrandoActionSheet = true
                        }) {
                            VStack {
                                Image(systemName: "paperclip")
                                    .foregroundColor(Color.azulPrincipal)
                                Text("Anexar")
                                    .foregroundColor(Color.azulPrincipal)
                                    .font(.system(size: 12))
                            }
                            .actionSheet(isPresented: $mostrandoActionSheet) {
                                ActionSheet(title: Text("Anexar"), message: Text("Escolha uma opção"), buttons: [
                                    .default(Text("Escolher Foto")) {
                                        
                                    },
                                    .default(Text("Anexar Arquivo")) {
                                        
                                    },
                                    .cancel()
                                ])
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                            if desenhando {
                                editandoDesenho.toggle()
                            } else {
                                desenhando = true
                                editandoDesenho = true
                            }
                        }) {
                            VStack {
                                Image(systemName: "pencil.tip.crop.circle")
                                    .foregroundColor(Color.azulPrincipal)
                                Text(editandoDesenho ? "OK" : "Desenhar")
                                    .foregroundColor(Color.azulPrincipal)
                                    .font(.system(size: 12))
                            }
                        }
                        Spacer()
                        Button(action: {
                            mostrandoOpcoesCamera = true
                        }) {
                            VStack {
                                Image(systemName: "camera")
                                    .foregroundColor(Color.azulPrincipal)
                                Text("Câmera")
                                    .foregroundColor(Color.azulPrincipal)
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
                                    .cancel()
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
            .onAppear {
                       // Mostra a TabBar ao voltar
                       if presentationMode.wrappedValue.isPresented {
                           // Lógica para mostrar a TabBar, se necessário
                       }
                   }
            
        }
    }
}

#Preview {
    NovaAnotacaoView()
}
