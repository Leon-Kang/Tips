	NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString:message.messageBody];
    NSError *error;
    NSDataDetector *dataDetector=[NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    NSArray *arrayOfAllMatches=[dataDetector matchesInString:message.messageBody options:NSMatchingReportProgress range:NSMakeRange(0, message.messageBody.length)];

    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        [text yy_setTextHighlightRange:match.range
                                 color:[UIColor orangeColor]
                       backgroundColor:[UIColor whiteColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                 
                                 [[IWDeepLinker sharedLinker] handleURL:[NSURL URLWithString:[message.messageBody substringWithRange:match.range]]];
                                 
                             }];
    }
    
    model.layout.text = text;