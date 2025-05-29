*** Variables ***
${CHECKOUT_BTN}                       id:checkOutButton
${CHECKOUTCART_ELMT}                  id:userCart
${NEXT_BTN}                           id:next_btn
${SHIPPINGDETAILS_ELMT}               id:detailslink
${SAFEPAYPAYNOW_BTN}                  id:pay_now_btn_SAFEPAY
${ORDERPAYMENTSUCESS_ELMT}            id:orderPaymentSuccess
${CREDITCARD_FIELD}                   id:creditCard
${SHIPPINGDETAILSHEADER_ELMT}         xpath=//label[text()='1. SHIPPING DETAILS ']
${PAYMENTHEADER_ELMT}                 xpath=//label[text()='2. PAYMENT METHOD']
${SAFEPAY_RADIO}                      xpath=//img[@alt='Safepay']/parent::div
${SAFEPAYUSER_FIELD}                  xpath=//input[@name='safepay_username']
${SAFEPAYPASS_FIELD}                  xpath=//input[@name='safepay_password']
${MASTERCREDIT_RADIO}                 xpath=//img[@alt='Master credit']/parent::div
${CCV_FIELD}                          xpath=//input[@name='cvv_number']
${MONTH_LIST}                         xpath=//select[@name='mmListbox']
${YEAR_LIST}                          xpath=//select[@name='yyyyListbox']
${CARDHOLDER_FIELD}                   xpath=//input[@name='cardholder_name']