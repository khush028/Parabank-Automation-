*** Variables ***
${Account_Button}    xpath=//a[text()='Open New Account']
${checking_account}    xpath=//select[@id="type"]
${Open_new_account_button}    xpath=//input[@class="button"]
${Account_number}    //a[@id="newAccountId"]


${ACCOUNT_OPEN_MESSAGE}    xpath=//div[@id='openAccountResult']//p[1]

${NEW_ACCOUNT_ID}          id:newAccountId