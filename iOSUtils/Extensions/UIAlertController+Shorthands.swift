
import UIKit
public extension UIAlertController {
  
  
  typealias AlertActionHandler = ((_ action: UIAlertAction)->Void)
  typealias SelectionHandler = ((_ actionIndex: Int)->Void)
  
  static func showGlobalAlertWithTitle(_ title: String, message: String, okTitle: String?, cancelTitle: String?,
                                       okHandler: AlertActionHandler?, cancelHandler: AlertActionHandler? ) {
    
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let cancelTitle = cancelTitle {
      let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
      controller.addAction(cancelAction)
    }
    
    let okAction = UIAlertAction(title: okTitle ?? NSLocalizedString("Ok", comment: "Ok string"), style: .default, handler: okHandler)
    controller.addAction(okAction)
    
    if let showOn = UIApplication.topViewController() {
      showOn.present(controller, animated: true, completion: nil)
    }
  }
  
  static func showGlobalAlertWithTitle(_ title: String, message: String, okTitle: String? = nil ) {
    self.showGlobalAlertWithTitle(title, message: message, okTitle: okTitle, cancelTitle: nil, okHandler: nil, cancelHandler: nil)
  }
  
  static func showGlobalAlertWithTitle(_ title: String, message: String, okTitle: String? = nil, okHandler: @escaping AlertActionHandler) {
    self.showGlobalAlertWithTitle(title, message: message, okTitle: okTitle, cancelTitle: nil, okHandler: okHandler, cancelHandler: nil)
  }
  
  static func showActionSheet(_ title: String, message: String, options:[String], selectionHandler: @escaping SelectionHandler){
    let sheetOptions: [SheetOptions] = options.map{SheetOptions.default(message: $0)}
    showActionSheet(title, message: message, options: sheetOptions, selectionHandler: selectionHandler)
  }

  static func showActionSheet(_ title: String, message: String, options:[SheetOptions], selectionHandler: @escaping SelectionHandler){

    let controller = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    for (index, element) in options.enumerated() {
      let action =  UIAlertAction(title: element.message, style: element.style, handler: {_ in
        selectionHandler(index)
      })
      controller.addAction(action)
    }
    if let showOn = UIApplication.topViewController() {
      showOn.present(controller, animated: true, completion: nil)
    }
  }
  
 enum SheetOptions {
    case `default`(message: String)
    case cancel(message: String)
    case destructive(message: String)
    
    var style: UIAlertAction.Style  {
      switch self {
      case .`default`: return .default
      case .cancel: return .cancel
      case .destructive: return .destructive
      }
    }
    
    var message: String  {
      switch self {
      case let .`default`(msg): return msg
      case let .cancel(msg): return msg
      case let .destructive(msg): return msg
      }
    }
  }
  
}



