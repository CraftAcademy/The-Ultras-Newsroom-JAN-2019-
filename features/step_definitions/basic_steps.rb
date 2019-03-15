When("I visit the site") do
    visit root_path
end

When("I visit the journalist page") do
    visit new_article_path
end

Given("the following articles exist") do |table|
    table.hashes.each do |article|
        create(:article, article)
    end
end

Given("I am logged in as {string}") do |email|
    user = User.find_by(email: email)
    login_as(user, scope: :user)
end  
  
Given("we have (1 )user with email {string} and role {string}") do |email, role|
    FactoryBot.create(:user, email: email, role: role)
end

Then("I fill in {string} with {string}") do |field, input|
    fill_in field, with: input
end

When("I click {string}") do |element|
    click_on element
end
  
