Given(/^I enter the homepage while logged in$/) do
  visit sessions_path
end

When(/^I type "(.*?)" in the search bar$/) do |arg1|
  fill_in('search_term' , :with => arg1)
end

When(/^Click "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^I should see the following songs:$/) do |songs_table|
  songs_table.hashes.each do |row|
    found = false
    all('tr').each do |tr|
      if tr.has_content?(row['Username']) && tr.has_content?(row['Title'])
        found = true
      end
    end
    if !found
      assert false
    end
  end
  assert true
end
