import SwiftUI
import UserNotifications

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
}
