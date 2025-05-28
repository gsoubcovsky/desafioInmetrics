*** Variables ***
${PRODUCT_NAME}                BEATS STUDIO 2 OVER-EAR MATTE BLACK HEADPHONES


${PRODUCTATPOPUP_ELMT}         xpath=//h3[normalize-space(text())='TOP RESULTS FOR: "${PRODUCT_NAME}"']
${POPUPLOAD_ELMT}              xpath=//div[@class='top6Products']
${SELECTPRODUCTATPOPUP_ELMT}   xpath=//p[normalize-space(text())="${PRODUCT_NAME}"]/parent::a
${ORDERDESCRIPTION_ELMT}       id:Description
${PRODUCTATORDERPAGE_ELMT}     xpath=//div[@id='product_2']//h1[normalize-space(text())="${PRODUCT_NAME}"]
${PRODUCTCOLOR_ELMT}           xpath=//span[@id='bunny' and contains(@style, 'rgb(65, 65, 65)') and contains(@class, 'BLACK')]
${PRODUCTQUANTITY_ELMT}        xpath=//input[@name='quantity']
${ADDPRODUCTTOCART_BTN}        xpath=//button[@name='save_to_cart']
${CHECKOUTPAGE_ELMT}           xpath=//h3[starts-with(normalize-space(.), 'SHOPPING CART')]
${PRODUCTATCHECKOUT_ELMT}      xpath=//label[text()="${PRODUCT_NAME}"]
