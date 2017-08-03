class Page < SitePrism::Page
  set_url "http://autojur.com.br/login.jsf"
  element :login, "login-form:username"
  element :password, "login-form:password"
  element :button, "login-form:form-button2"
  
end