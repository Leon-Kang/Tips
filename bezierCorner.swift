        // vote info content layer mask
        let bounds = self.voteInfoContentView.bounds
        let bezierPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: [ .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 4.0, height: 0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        self.voteInfoContentView.layer.mask = shapeLayer