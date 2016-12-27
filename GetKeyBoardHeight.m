[[NSNotificationCenter defaultCenter] addObserver:self
                                     selector:@selector(keyboardWasShown:)
                                         name:UIKeyboardDidShowNotification
                                       object:nil];

- (void)keyboardWasShown:(NSNotification *)notification
{

// Get the size of the keyboard.
CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

//Given size may not account for screen rotation
int height = MIN(keyboardSize.height,keyboardSize.width);
int width = MAX(keyboardSize.height,keyboardSize.width);

//your other code here..........
}