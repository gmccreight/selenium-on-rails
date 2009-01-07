# !!!WARNING!!! don't run this script unless you are prepared to have
# your RedCloth gem be messed with.

# This is a special script for testing the different RedCloth
# versions.  It tests that different versions of the RedCloth gem work
# with the Selenium on Rails tests, and that the tests even run when
# there is no RedCloth gem installed.

def check_tests_run_to_completion
  if `rake 2>/dev/null`.match(/Finished in .* seconds/)
    puts "OK"
  else
    puts "NOT OK - Tests did not run to completion"
  end
end

puts "should produce three OKs"

# Uninstall all versions of RedCloth.
`sudo gem uninstall -x -a RedCloth`
check_tests_run_to_completion()

# Install an older version of RedCloth
`sudo gem install --no-ri --no-rdoc -v=3.0.4 RedCloth`
check_tests_run_to_completion()

# The latest version will be in the 4.x series as of this writing.
`sudo gem install --no-ri --no-rdoc RedCloth`
check_tests_run_to_completion()
