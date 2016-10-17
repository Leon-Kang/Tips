- (void)setupCellWithDescription:(NSString *)description imageName:(NSString *)imageName {
    _descriptionStr = description;
    _iconImage.image = [UIImage imageNamed:imageName];
    
    NSInteger numberOfLine = [self numberOfLine:_descriptionLbl string:_descriptionStr];
    if (numberOfLine > 1) {
        self.height = _descriptionLbl.height * numberOfLine + 16;
        _descriptionLbl.attributedText = [self getAttributedStringWithString:description lineSpace:lineSpace];
    } else {
        self.height = _descriptionLbl.height + 16;
        _descriptionLbl.text = description;
    }
    
}

#pragma mark -- pravite Tool
- (NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = lineSpace;
    NSRange range = NSMakeRange(0, [string length]);
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return attributedString;
}

- (NSInteger)numberOfLine:(UILabel *)label string:(NSString *)str {
    CGFloat unitHeight = [self heightForWidth:label.width usingFont:label.font string:@"A"];
    CGFloat blockHeight = [self heightForWidth:label.width usingFont:label.font string:str];
    return ceilf(blockHeight / unitHeight);
}

- (CGFloat)heightForWidth:(CGFloat)width usingFont:(UIFont *)font string:(NSString *)str {
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [str boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:context];
    return r.size.height;
}