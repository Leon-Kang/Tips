    func updateNavigationBackgroud(alpha: CGFloat) {
        struct holder {
            static var alpha = CGFloat.leastNonzeroMagnitude
        }
        if let navigationController = self.navigationController {
            if holder.alpha != alpha {
                holder.alpha = alpha
                if alpha > 0 {
                    navigationController.navigationBar.setBackgroundImage(navigationImage, for: .default)
                }
                let backgroundView = navigationController.navigationBar.subviews.first
                backgroundView?.alpha = alpha
            }
            
        }
    }
