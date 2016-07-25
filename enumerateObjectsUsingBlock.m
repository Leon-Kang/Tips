NSArray <UILabel *> *labels = @[self.benefitLabel1, self.benefitLabel2, self.benefitLabel3];
    
    [@[ls_home_list_toplist_1, ls_home_list_toplist_2, ls_home_list_toplist_3] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        labels[idx].text = (NSString *)obj;
        labels[idx].textColor = [UIColor whiteColor];
        labels[idx].font = [IWStyle fontLatoRegularOfSize:14];
    }];