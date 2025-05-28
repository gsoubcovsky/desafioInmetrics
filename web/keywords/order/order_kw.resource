*** Settings ***
Resource        ../../configs/settings.resource
Resource        ../homepage/login_kw.resource

*** Keywords ***
the user clicks in the search button
    Check if the element exists and is visible at the page            ${SEARCH_BTN}
    Click Element                                                     ${SEARCH_BTN}
    Check if the element exists and is visible at the page            ${SEARCH_FIELD}

AutoComplete Should Be Fully Visible
    ${opacity}    Execute Javascript    return parseFloat(window.getComputedStyle(document.querySelector('.autoCompleteCover')).getPropertyValue('opacity'));
    ${is_ready}    Evaluate    float(${opacity}) >= 0.9
    Should Be True    ${is_ready}

Wait Until AutoComplete Is Fully Visible
    Wait Until Keyword Succeeds    15s    0.2s    AutoComplete Should Be Fully Visible

the user searchs for ${product} product
    #Check if the element exists and is visible at the page            ${SEARCH_FIELD}
    Wait Until AutoComplete Is Fully Visible
    Input Text                                                        ${SEARCH_FIELD}                   ${product}
    Check if the element exists and is visible at the page            ${SEARCH_POPUP}
    Check if the element exists and is visible at the page            ${POPUPLOAD_ELMT}
    Check if the element exists and is visible at the page            ${PRODUCTATPOPUP_ELMT}

the user selects the product in the search bar
    Check if the element exists and is visible at the page            ${SELECTPRODUCTATPOPUP_ELMT}
    Click Element                                                     ${SELECTPRODUCTATPOPUP_ELMT}
    Check if the element exists and is visible at the page            ${ORDERDESCRIPTION_ELMT}
    Check if the element exists and is visible at the page            ${PRODUCTATORDERPAGE_ELMT}

the user chooses the product details and adds ${quantity} of them to the cart
    Check if the element exists and is visible at the page            ${PRODUCTCOLOR_ELMT}
    Check if the element exists and is visible at the page            ${PRODUCTQUANTITY_ELMT}
    Click Element                                                     ${PRODUCTQUANTITY_ELMT}
    Press Keys                                                        ${PRODUCTQUANTITY_ELMT}            DELETE
    Input Text                                                        ${PRODUCTQUANTITY_ELMT}            ${quantity}
    Capture Page Screenshot
    Page Should Contain Button                                        ${ADDPRODUCTTOCART_BTN}
    Click Button                                                      ${ADDPRODUCTTOCART_BTN}
    Check if the element exists and is visible at the page            ${CART_BTN}
    Click Element                                                     ${CART_BTN}
    
the user verifies if the product is in the cart
    Check if the element exists and is visible at the page            ${CHECKOUTPAGE_ELMT}
    Check if the element exists and is visible at the page            ${PRODUCTATCHECKOUT_ELMT}
