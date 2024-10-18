import SwiftUI
import UserNotifications
import AVFoundation
import Photos

class GerenciadorDeNotificacoes {
    
    static let instancia = GerenciadorDeNotificacoes() // Singleton
    
//    func solicitarAutorizacao() {
//        let opcoes: UNAuthorizationOptions = [.alert, .sound, .badge]
//        UNUserNotificationCenter.current().requestAuthorization(options: opcoes) { (sucesso, erro) in
//            if let erro = erro {
//                print("ERRO: \(erro)")
//            } else {
//                print("SUCESSO")
//            }
//        }
//    }
    
    func agendarNotificacao(para segundos: TimeInterval) {
        let conteudo = UNMutableNotificationContent()
        conteudo.title = "Revisão de Anotações"
        conteudo.subtitle = "Hora de revisar suas anotações!"
        conteudo.sound = .default
        conteudo.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)

        let disparador = UNTimeIntervalNotificationTrigger(timeInterval: segundos, repeats: false)

        let requisicao = UNNotificationRequest(identifier: UUID().uuidString, content: conteudo, trigger: disparador)

        UNUserNotificationCenter.current().add(requisicao) { erro in
            if let erro = erro {
                print("Erro ao agendar a notificação: \(erro)")
            } else {
                print("Notificação agendada com sucesso para \(segundos) segundos!")
            }
        }
    }
    
//    func agendarNotificacao(para dias: TimeInterval) {
//        let conteudo = UNMutableNotificationContent()
//        conteudo.title = "Revisão de Anotações"
//        conteudo.subtitle = "Hora de revisar suas anotações!"
//        conteudo.sound = .default
//        conteudo.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
//
//        // Converter dias para segundos (1 dia = 86400 segundos)
//        let segundos = dias * 86400
//
//        let disparador = UNTimeIntervalNotificationTrigger(timeInterval: segundos, repeats: false)
//
//        let requisicao = UNNotificationRequest(identifier: UUID().uuidString, content: conteudo, trigger: disparador)
//
//        UNUserNotificationCenter.current().add(requisicao) { erro in
//            if let erro = erro {
//                print("Erro ao agendar a notificação: \(erro)")
//            } else {
//                print("Notificação agendada com sucesso para \(dias) dias!")
//            }
//        }
//    }


    func cancelarNotificacao() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
   

    func requestCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            print("Permissão para câmera já concedida.")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    print("Permissão para câmera concedida.")
                } else {
                    print("Permissão para câmera negada.")
                }
            }
        case .denied:
            print("Permissão para câmera negada.")
        default:
            break
        }
    }

  

    func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                print("Permissão para a biblioteca de fotos concedida.")
            case .denied:
                print("Permissão para a biblioteca de fotos negada.")
            case .notDetermined:
                print("Permissão para a biblioteca de fotos não determinada.")
            default:
                break
            }
        }
    }

}
