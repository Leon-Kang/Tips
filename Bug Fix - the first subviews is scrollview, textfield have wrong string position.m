    // Fixed Issue #3223 QAI #02: 0245 & 0248 input text disappears when close and re-open app
    self.automaticallyAdjustsScrollViewInsets = NO;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
