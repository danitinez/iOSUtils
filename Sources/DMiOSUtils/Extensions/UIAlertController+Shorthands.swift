
import UIKit
public extension UIAlertController {
  
  
  typealias AlertActionHandler = ((_ action: UIAlertAction, _ controller: UIAlertController)->Void)
  typealias SelectionHandler = ((_ actionIndex: Int)->Void)
  
  static func showGlobalAlertWithTitle(_ title: String,
                                       message: String,
                                       okTitle: String?,
                                       cancelTitle: String?,
                                       isDestructive: Bool = false,
                                       textfieldConfiguration: ((UITextField) -> Void)? = nil,
                                       okHandler: AlertActionHandler?,
                                       cancelHandler: AlertActionHandler? ) {
    
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let cancelTitle = cancelTitle {
      let cancelAction = UIAlertAction(title: cancelTitle,
                                       style: .cancel) { action in
                                        cancelHandler?(action, controller)
      }
      controller.addAction(cancelAction)
    }
    
    let okAction = UIAlertAction(title: okTitle ?? NSLocalizedString("Ok", comment: "Ok string"),
                                 style: isDestructive ? .destructive : .default)
                                 { action in
                                    okHandler?(action, controller)
    }
    controller.addAction(okAction)
    
    if let config = textfieldConfiguration {
      controller.addTextField(configurationHandler: config)
    }
    
    if let showOn = UIApplication.topViewController() {
      showOn.present(controller, animated: true, completion: nil)
    }
  }
  
  static func showGlobalAlertWithTitle(_ title: String, message: String, okTitle: String? = nil ) {
    self.showGlobalAlertWithTitle(title, message: message, okTitle: okTitle, cancelTitle: nil, textfieldConfiguration: nil, okHandler: nil, cancelHandler: nil)
  }
  
  static func showGlobalAlertWithTitle(_ title: String, message: String, okTitle: String? = nil, okHandler: @escaping AlertActionHandler) {
    self.showGlobalAlertWithTitle(title, message: message, okTitle: okTitle, cancelTitle: nil, textfieldConfiguration: nil, okHandler: okHandler, cancelHandler: nil)
  }
  
  
  static func showGlobalInputAlert(title: String, message: String, okTitle: String? = nil, cancelTitle: String? = "Cancel", configHandler: ((UITextField)->Void)?=nil, okHandler: @escaping AlertActionHandler) {
    let txtConfig = configHandler ?? {txtField -> Void in }
    self.showGlobalAlertWithTitle(title,
                                  message: message,
                                  okTitle: okTitle,
                                  cancelTitle: cancelTitle,
                                  isDestructive: false,
                                  textfieldConfiguration: txtConfig,
                                  okHandler: okHandler,
                                  cancelHandler: nil)
    //1. Create the alert controller.
//    let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
//
//    //2. Add the text field. You can configure it however you need.
//    alert.addTextField { (textField) in
//        textField.text = "Some default text"
//    }
//
//    // 3. Grab the value from the text field, and print it when the user clicks OK.
//    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//        let textField = alert.textFields![0] // Force unwrapping because we know it exists.
//        print("Text field: \(textField.text)")
//    }))

    // 4. Present the alert.
  }
  
  
  //MARK: - Action Sheet
  
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



