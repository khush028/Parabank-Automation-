*** Variables ***
${register_button}    xpath=//a[text()='Register']
${register_form}    xpath=(//input[@class="button"])[2]
${login_button}    xpath=(//input[@class="button"])[1]
${first_name}    xpath=//input[@id="customer.firstName"]
${last_name}    xpath=//input[@id="customer.lastName"]
${address}    xpath=//input[@id="customer.address.street"]

${city}  xpath=//input[@id="customer.address.city"]
${state}  xpath=//input[@id="customer.address.state"]
${zip_code}  xpath=//input[@id="customer.address.zipCode"]
${phone}  xpath=//input[@id="customer.phoneNumber"]
${ssn}  xpath=//input[@id="customer.ssn"]

${use_rname}  xpath=//input[@id="customer.username"]
${pass_word}  xpath=//input[@id="customer.password"]
${confirm_password}    xpath=//input[@id="repeatedPassword"]

${WELCOME_MESSAGE}    xpath=//h1[@class='title']