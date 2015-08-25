# Scenario: Task 1 - Straightforward upload - local
Then /^Upload but do not save img 1 local$/ do
  $driver.get ("http://cgi-lib.berkeley.edu/ex/fup.html")
  upload_btn = $driver.find_element(:xpath, "//input[@type= 'file']")
  upload_btn.send_keys "C:/Test/big-logo.png"  # e.g. "/../Data/example.bmp"
  element = $driver.find_element(:xpath, "//input[@type = 'submit']")
  element.click
end

# Scenario: Task 1 - Straightforward upload - Git
Then /^Upload but do not save img 1 git$/ do
  $driver.get ("http://cgi-lib.berkeley.edu/ex/fup.html")
  file = File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/big-logo.png')
  upload_btn = $driver.find_element(:xpath, "//input[@type= 'file']")
  upload_btn.send_keys file  # e.g. "/../Data/example.bmp"
  element = $driver.find_element(:xpath, "//input[@type = 'submit']")
  element.click
end

# Scenario: Task 1 - Straightforward upload local
Then /^Upload but do not save img local$/ do
  $driver.get ("http://fineuploader.com/demos")
  upload_input = $driver.find_element(:xpath, "(//div[@class = 'qq-upload-button-selector qq-upload-button']/input[@type= 'file'])[2]")
  $driver.execute_script "$('input').show();"
  upload_input.send_keys "C:/Test/big-logo.png"
end

# Scenario: Task 1 - Straightforward upload git
Then /^Upload but do not save img git$/ do
  $driver.get ("http://fineuploader.com/demos")
  file = File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/images2.jpg')
  upload_input = $driver.find_element(:xpath, "(//div[@class = 'qq-upload-button-selector qq-upload-button']/input[@type= 'file'])[2]")
  $driver.execute_script "$('input').show();"
  upload_input.send_keys file
end

# Scenario: Task 2 - Randomize it local
Then /^Create a loop, which will grab random pics let it be 3, upload them one by one local$/ do
  $driver.get ("http://fineuploader.com/demos")
  images = ["C:/Test/big-logo.png", "C:/Test/images.png", "C:/Test/index.jpg", "C:/Test/images1.jpg", "C:/Test/images2.jpg"]
  for i in 1..3 do
    upload_input = $driver.find_element(:xpath, "(//div[@class = 'qq-upload-button-selector qq-upload-button']/input[@type= 'file'])[2]")
    $driver.execute_script "$('input').show();"
    upload_input.send_keys images.sample
  end
end

# Scenario: Task 2 - Randomize it git
Then /^Create a loop, which will grab random pics let it be 3, upload them one by one git$/ do
  $driver.get ("http://fineuploader.com/demos")
  images = [File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/big-logo.png'), File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/images.png'), File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/index.jpg'), File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/images1.jpg'), File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/images2.jpg')]
  for i in 1..3 do
    upload_input = $driver.find_element(:xpath, "(//div[@class = 'qq-upload-button-selector qq-upload-button']/input[@type= 'file'])[2]")
    $driver.execute_script "$('input').show();"
    upload_input.send_keys images.sample
  end
end

# Scenario: Task 2: Uploads local
Then /^Upload file, not submit - please not heavy one local$/ do
  $driver.get ("https://angular-file-upload.appspot.com")
  upload_btn = $driver.find_element(:xpath, "//input[@type= 'file']")
  upload_btn.send_keys "C:/Test/big-logo.png"
end

# Scenario: Task 2: Uploads git
Then /^Upload file, not submit - please not heavy one git$/ do
  $driver.get ("https://angular-file-upload.appspot.com")
  file = File.join(File.expand_path("..", Dir.pwd), '/TestFilesFolder/big-logo.png')
  upload_btn = $driver.find_element(:xpath, "//input[@type= 'file']")
  upload_btn.send_keys "C:/Test/big-logo.png"
end