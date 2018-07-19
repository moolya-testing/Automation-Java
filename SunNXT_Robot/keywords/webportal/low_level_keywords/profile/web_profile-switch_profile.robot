*** Settings ***
Documentation    Suite description
Library                     Dialogs
Library                     String
Resource                    ../locators/webportal/profile.robot
Resource                    ../locators/webportal/homepage.robot

*** Keywords ***
Wait Until Switch Profile Pop-Up Is Displayed
    wait until element is visible  ${switch_profile_pop-up}

#switch profile operation
Switch Profile
    [Arguments]  ${profile}
    run keyword if  "${profile}"=="Primary"  Switch To Primary Profile
    ...  ELSE IF  "${profile}"=="First Secondary"  Switch To First Secondary Profile
    ...  ELSE IF  "${profile}"=="Second Secondary"  Switch To Second Secondary Profile
    ...  ELSE IF  "${profile}"=="Third Secondary"  Switch To Third Secondary Profile
    wait until element is enabled  ${profile_icon}

Switch To Primary Profile
    ${status}=  run keyword and return status  page should contain element  ${user_profile#1}
    run keyword if  "${status}"=="True"  Select Primary Profile
    ...  ELSE  Input A New Profile To Be Selected

Select Primary Profile
    ${profile_selected}=  get text  ${user_profile#1}
    ${profile_selected}=  strip string  ${profile_selected}  mode=right
    convert to string  ${profile_selected}
    set global variable  ${profile_selected}
    click element  ${user_profile#1}

Switch To First Secondary Profile
    ${status}=  run keyword and return status  page should contain element  ${user_profile#2}
    run keyword if  "${status}"=="True"  Select First Secondary Profile
    ...  ELSE  Input A New Profile To Be Selected

Select First Secondary Profile
    ${profile_selected}=  get text  ${user_profile#2}
    ${profile_selected}=  strip string  ${profile_selected}  mode=right
    convert to string  ${profile_selected}
    set global variable  ${profile_selected}
    click element  ${user_profile#2}

Switch To Second Secondary Profile
    ${status}=  run keyword and return status  page should contain element  ${user_profile#3}
    run keyword if  "${status}"=="True"  Select Second Secondary Profile
    ...  ELSE  Input A New Profile To Be Selected

Select Second Secondary Profile
    ${profile_selected}=  get text  ${user_profile#3}
    ${profile_selected}=  strip string  ${profile_selected}  mode=right
    convert to string  ${profile_selected}
    set global variable  ${profile_selected}
    click element  ${user_profile#3}

Switch To Third Secondary Profile
    ${status}=  run keyword and return status  page should contain element  ${user_profile#4}
    run keyword if  "${status}"=="True"  Select Third Secondary Profile
    ...  ELSE  Input A New Profile To Be Selected

Select Third Secondary Profile
    ${profile_selected}=  get text  ${user_profile#4}
    ${profile_selected}=  strip string  ${profile_selected}  mode=right
    convert to string  ${profile_selected}
    set global variable  ${profile_selected}
    click element  ${user_profile#4}

Input A New Profile To Be Selected
    [Arguments]  ${profile}
    log many  PROFILE USED TO SWITCH "${profile}" IS ALREADY SELECTED
    ${profile}=  get value from user  PROFILE USED TO SWITCH "${profile}" IS ALREADY SELECTED  default
    Switch Profile