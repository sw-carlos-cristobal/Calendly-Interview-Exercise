After do |scenario|
  @driver.quit
end

AfterStep do
  img = @driver.screenshot_as(:png)
  attach(img, 'image/png')
end