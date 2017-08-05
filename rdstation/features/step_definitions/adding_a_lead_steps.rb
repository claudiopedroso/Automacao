Before do
  visit 'https://app-staging.rdstation.com.br/leads'
  fill_in('user_email', :with => 'claudiopedroso@gmail.com')
  fill_in('user_password', :with => '72VWqN8')
  click_button('Entrar')
  expect(page).to have_text("Base de Leads")
  end

Before ('@edit_lead') do
  within "#leads_crm > div.container-nav-pills" do
    click_button('Ações')
    click_on("Inserir Lead")
    end
    expect(page).to have_text("Conversão")
    fill_in('source', :with => 'Teste de edição de lead')
    fill_in('lead_name', :with => 'Lead Para Edição Pedroso')
    fill_in('lead_email', :with => 'leadpedroso@gmail.com')
    fill_in('lead_job_title', :with => 'QA Analyst')
    click_on("Salvar")
    visit 'https://app-staging.rdstation.com.br/leads'
  end

Before ('@filter_by_seg') do
  within "#leads_crm > div.container-nav-pills" do
    click_button('Ações')
    click_on("Inserir Lead")
    end
  expect(page).to have_text("Conversão")
  fill_in('source', :with => 'Teste de filtro de lead por segmentação')
  fill_in('lead_name', :with => 'Lead Para Segmentação Pedroso')
  fill_in('lead_email', :with => 'leadsegmentadopedroso@gmail.com')
  fill_in('lead_job_title', :with => 'QA Analyst')
  click_on("Salvar")
  visit 'https://app-staging.rdstation.com.br/leads'
  page.evaluate_script 'window.location.reload()'
  click_on('Lead Para Segmentação Pedroso')
  click_on('Editar')
  select('Cliente', :from => 'lead_lifecycle_stage')
  click_on("Salvar")
  visit 'https://app-staging.rdstation.com.br/leads'
end

Before ('@link_company') do
  within "#leads_crm > div.container-nav-pills" do
    click_button('Ações')
    click_on("Inserir Lead")
    end
    expect(page).to have_text("Conversão")
    fill_in('source', :with => 'Teste vinculo de lead')
    fill_in('lead_name', :with => 'Lead Sem Empresa Pedroso')
    fill_in('lead_email', :with => 'leadsemempresapedroso@gmail.com')
    fill_in('lead_job_title', :with => 'QA Analyst')
    click_on("Salvar")
    visit 'https://app-staging.rdstation.com.br/leads'
    click_link('Empresas')
    click_on('insert_new_company_index')
    fill_in('inputNameCompany', :with => 'Kitkat Co.')
    fill_in('inputEmailCompany', :with => 'Kitkat@gmail.com')
    fill_in('inputSiteCompany', :with => 'www.kitkat.com.br')
    fill_in('inputPhoneCompany', :with => '4830243428')
    select('Software e Cloud', :from => 'company_company_sector_id')
    click_on("Salvar")
    visit 'https://app-staging.rdstation.com.br/leads'
end

After ('@link_company') do
  visit 'https://app-staging.rdstation.com.br/leads'
  click_on('Lead Sem Empresa Pedroso')
  click_on('Editar')
  click_on("Empresa")
  within ("#edit_company > div > div > div.col-xs-3 > ul") do
    click_on("Desvincular Empresa").accept_alert
  end
  click_on("Salvar")
end

When(/^I add a lead to the base$/) do
  within "#leads_crm > div.container-nav-pills" do
    click_button('Ações')
    click_on("Inserir Lead")
    end
    expect(page).to have_text("Conversão")
    fill_in('source', :with => 'Teste de iserção manual')
    fill_in('lead_name', :with => 'Claudio Pedroso')
    fill_in('lead_email', :with => 'claudiopedroso@gmail.com')
    fill_in('lead_job_title', :with => 'QA Analyst')
    click_on("Salvar")
end

Then(/^I should see it on the leads list$/) do
  visit 'https://app-staging.rdstation.com.br/leads'
  expect(page).to have_text('Claudio Pedroso')
end

When(/^I add a company to the base$/) do
  click_link('Empresas')
  click_on('insert_new_company_index')
  fill_in('inputNameCompany', :with => 'Babalu Co.')
  fill_in('inputEmailCompany', :with => 'babalu@gmail.com')
  fill_in('inputSiteCompany', :with => 'www.babalu.com.br')
  fill_in('inputPhoneCompany', :with => '4830243428')
  select('Software e Cloud', :from => 'company_company_sector_id')
  click_on("Salvar")
end

Then(/^I should see it on the companies list$/) do
  visit 'https://app-staging.rdstation.com.br/empresas'
  expect(page).to have_text('Babalu Co.')
end

When(/^I edit a lead$/) do
  click_on('Lead Para Edição Pedroso')
  click_on('Editar')
  fill_in('inputName', :with => 'Lead Editado Pedroso')
  click_on("Salvar")
end

Then(/^I should see the new information on the lead$/) do
  expect(page).to have_text('Lead Editado Pedroso')
  expect(page).not_to have_text('Lead Para Edição Pedroso')
end

When(/^I link a company to a lead$/) do
  click_on('Lead Sem Empresa Pedroso')
  click_on('Editar')
  click_on("Empresa")
  click_on('link_company')
  search_company = fill_in('change-company-query', :with => 'Babalu Co.')
  sleep 3
    search_company.native.send_keys(:down, :return)
  click_on("Vincular")
  click_on("Salvar")
end

Then(/^I should see the company name on the lead page$/) do
  expect(page).to have_text('Babalu Co.')
end

When(/^I search for a lead using "Pedroso"$/) do
  fill_in('query', :with => 'Pedroso').native.send_keys(:return)
  expect(page).to have_text('Leads encontrados')
end

Then(/^I should see only the leads with "Pedroso" on the list$/) do
  expect(page).to have_content("Pedroso")
end

When(/^I filter a lead by segmentation$/) do
    select('Clientes (estágio no funil)', :from => 'segmentation_list')
  end

Then(/^I should only see leads that belong to that segmentation$/) do
  expect(page).to have_content("Lead Para Segmentação Pedroso")
end
=begin
When(/^I add a tag to the filtered leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the tag on the filtered leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I remove a tag from the filtered leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not the the tag on the leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I order the leads list by a parameter$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the leads in that order$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I export the leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should receive a file with all the leads$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
=end
