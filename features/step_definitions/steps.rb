require 'selenium-webdriver'
require 'webdrivers'

Given('the webpage {string} is loaded') do |url|
  @driver = Selenium::WebDriver.for :chrome
  @driver.get url
  @driver.switch_to.frame @driver.find_element(:id, 'result')
end

When('{string} is input into the text field') do |text|
  @gridSize = text
  @driver.find_element(:id, 'number').send_keys text
end

When('the Play button is clicked') do
  @driver.find_element(:id, 'start').click
end

When('the page is refreshed') do
  @driver.navigate.refresh
  @driver.switch_to.frame @driver.find_element(:id, 'result')
end

When('{string} wins the game') do |player|
  lastIndex = 0
  # Alternates between the first and second column before the last row
  (0..(@gridSize.to_i**2 - @gridSize.to_i - 1)).step(@gridSize.to_i) do |i|
    lastIndex = i
    @driver.find_element(:id, i.to_s).click
    @driver.find_element(:id, (i+1).to_s).click
  end
  if(player == 'X')
    @driver.find_element(:id, (lastIndex + @gridSize.to_i).to_s).click
  elsif(player == 'O')
    @driver.find_element(:id, (lastIndex + 2).to_s).click
    @driver.find_element(:id, (lastIndex + @gridSize.to_i + 1).to_s).click
  else
    raise 'Invalid player'
  end
end

When('the game ends in a tie') do
  if(@gridSize.to_i.even?)
    # Fill in every row before the last
    for i in (0..(@gridSize.to_i**2 - @gridSize.to_i - 1))
      @driver.find_element(:id, i.to_s).click
    end
    # Fill in the last row in reverse
    for i in (@gridSize.to_i**2 - 1).downto(@gridSize.to_i**2 - @gridSize.to_i - 1)
      @driver.find_element(:id, i.to_s).click
    end
  else
    # Fill in every row starting with the second column, and backtracking to the first column
    (0..(@gridSize.to_i**2 - 1)).step(@gridSize.to_i) do |i|
      for j in ((i + 1)..(i + @gridSize.to_i - 1))
        @driver.find_element(:id, j.to_s).click
      end
      @driver.find_element(:id, i.to_s).click
    end
  end
end

Then('the grid should be accurately displayed') do
  table = @driver.find_element(:id, 'table')
  expect(table.displayed?).to be true
  expect(table.find_elements(:tag_name, 'tr').size).to eq @gridSize.to_i
  expect(table.find_elements(:tag_name, 'tr')[0].find_elements(:tag_name, 'td').size).to eq @gridSize.to_i
end

Then('the grid should be empty') do
  table = @driver.find_element(:id, 'table')
  expect(table.displayed?).to be true
  expect(table.find_elements(:tag_name, 'tr').size).to eq 0
end

Then('the winner is displayed as {string}') do |player|
  expect(@driver.find_element(:id, 'endgame').text).to eq "Congratulations player #{player}! You've won. Refresh to play again!"
end

Then('a tie is announced') do
  expect(@driver.find_element(:id, 'endgame').text).to eq "It's a tie! Refresh to play again!"
end