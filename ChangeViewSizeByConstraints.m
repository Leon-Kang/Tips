@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplistHeightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplistWidthConstraints;

- (void)setupToplistView {
    _toplistHeightConstraint.constant = SCREEN_WIDTH;
    _toplistHeightConstraint.constant = SCREEN_WIDTH/6;
    [self.view updateConstraints];
}