
import UIKit

public class CollectionCellWrapper<T: UIView>: UICollectionViewCell {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }
  
  private func setupUI() {
    let view = T()
    view.frame = contentView.bounds
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    contentView.addSubview(view)
  }
  
  public func getView() -> T {
    return contentView.subviews.first! as! T
  }
  
}

