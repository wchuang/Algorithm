import UIKit

private var key: UInt8 = 0

extension UIButton {

    var enlargeSize: Double? {
        get {
            return objc_getAssociatedObject(self, &key) as? Double
        }
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let enlargeSize = enlargeSize else { return self.bounds.contains(point) }
        var frame = self.bounds
        let size = CGFloat(enlargeSize)
        frame.origin.x -= size
        frame.origin.y -= size
        frame.size.width += size * 2
        frame.size.height += size * 2
        return frame.contains(point)
    }
}

let button = UIButton()
button.enlargeSize = 10
